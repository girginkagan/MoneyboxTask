//
//  HomeViewController.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit
import RxSwift

final class HomeViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.home
    var viewModel: HomeViewModel?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        
    }
    
    private func setBindings() {
        guard let viewModel = viewModel else { return }
        
        viewModel.isError.bind { [weak self] data in
            if let errorData = data {
                guard let self = self else { return }
                AlertUtil.showStandardAlert(parentController: self, title: .local(.error), message: APIErrorGenerator().generateError(error: errorData))
            }
        }.disposed(by: disposeBag)
        
        viewModel.isLoading.subscribe({ [weak self] event in
            event.element ?? false ? self?.showLoadingIndicator() : self?.hideLoadingIndicator()
        }).disposed(by: disposeBag)

    }
}

