//
//  SplashViewController.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit
import RxSwift

final class SplashViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.splash
    var viewModel: SplashViewModel?
    private let disposeBag = DisposeBag()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setUI()
        setBindings()
    }
    
    private func setUI() {
        
    }
    
    private func setBindings() {
        guard let viewModel = viewModel else { return }
        
        viewModel.getData()
        
        viewModel.isError
            .bind { [weak self] data in
                if let errorData = data {
                    guard let self = self else { return }
                    AlertUtil.showStandardAlert(parentController: self, title: .local(.error), message: APIErrorGenerator().generateError(error: errorData))
                }
            }
            .disposed(by: disposeBag)
    }

}
