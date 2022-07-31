//
//  ProductViewController.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import UIKit
import RxSwift

final class ProductViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.product
    var viewModel: ProductViewModel?
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak private var btnAddMoney: UIButton!
    @IBOutlet weak private var lblMoneybox: UILabel!
    @IBOutlet weak private var lblPlanValue: UILabel!
    @IBOutlet weak private var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setBindings()
    }
    
    private func setUI() {
        lblTitle.text = viewModel?.selectedProduct?.product?.friendlyName
        lblPlanValue.text = .local(.planValue) + "£\(String(viewModel?.selectedProduct?.planValue ?? 0.0))"
        lblMoneybox.text = .local(.moneybox) + "£\(String(viewModel?.selectedProduct?.moneybox ?? 0.0))"
        
        btnAddMoney.setTitle(.local(.addMoney), for: .normal)
        btnAddMoney.accessibilityIdentifier = "btnAddMoney"
        
        btnAddMoney.rx.tap.subscribe { [weak self] _ in
            self?.viewModel?.setOneOffPayment()
        }.disposed(by: disposeBag)
    }
    
    private func setBindings() {
        guard let viewModel = viewModel else { return }
        
        viewModel.isError.bind { [weak self] data in
            if let errorData = data {
                guard let self = self else { return }
                if errorData.errorCode == APIStatusCodes.unAuthorized.rawValue {
                    AlertUtil.showStandardAlertWithCompletion(parentController: self, title: .local(.error), message: APIErrorGenerator().generateError(error: errorData)) {
                        self.viewModel?.removeUser()
                        self.viewModel?.coordinator?.presentSplash()
                    }
                } else {
                    AlertUtil.showStandardAlert(parentController: self, title: .local(.error), message: APIErrorGenerator().generateError(error: errorData))
                }
            }
        }.disposed(by: disposeBag)
        
        viewModel.isLoading.subscribe({ [weak self] event in
            event.element ?? false ? self?.showLoadingIndicator() : self?.hideLoadingIndicator()
        }).disposed(by: disposeBag)
        
        viewModel.isOneOffPaymentDone.subscribe({ [weak self] event in
            if event.element ?? false {
                self?.viewModel?.coordinator?.goBack()
            }
        }).disposed(by: disposeBag)
    }
}
