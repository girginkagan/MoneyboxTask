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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setBindings()
    }
    
    private func setUI() {
        
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

        viewModel.setBindings()
    }
}
