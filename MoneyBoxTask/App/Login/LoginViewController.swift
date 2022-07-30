//
//  LoginViewController.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit
import RxSwift

final class LoginViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.login
    var viewModel: LoginViewModel?
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak private var tfPassword: UITextField!
    @IBOutlet weak private var tfMail: UITextField!
    @IBOutlet weak private var btnLogin: UIButton!
    @IBOutlet weak private var svLogin: UIStackView!
    @IBOutlet weak private var ivLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setBindings()
    }
    
    private func setUI() {
        tfMail.placeholder = .local(.email)
        tfPassword.placeholder = .local(.password)
        btnLogin.setTitle(.local(.login), for: .normal)
        
        tfMail.setLeftPaddingPoints(20)
        tfPassword.setLeftPaddingPoints(20)
        
        animateLogo()
    }
    
    private func setBindings() {
        guard let viewModel = viewModel else { return }
        
        viewModel.setBindings()
        
        viewModel.isError.bind { [weak self] data in
            if let errorData = data {
                guard let self = self else { return }
                AlertUtil.showStandardAlert(parentController: self, title: .local(.error), message: APIErrorGenerator().generateError(error: errorData))
            }
        }.disposed(by: disposeBag)
        
        viewModel.isLoading.subscribe({ [weak self] event in
            event.element ?? false ? self?.showLoadingIndicator() : self?.hideLoadingIndicator()
        }).disposed(by: disposeBag)

        viewModel.isLoggedIn.bind { data in
            if data {
                (viewModel.coordinator?.parentCoordinator as? AppCoordinator)?.presentHome()
            }
        }.disposed(by: disposeBag)
        
        tfMail.rx.text.orEmpty
            .bind(to: viewModel.emailViewModel.data)
            .disposed(by: disposeBag)
                
        tfPassword.rx.text.orEmpty
            .bind(to: viewModel.passwordViewModel.data)
            .disposed(by: disposeBag)
                
        btnLogin.rx.tap.do(onNext: { [weak self] in
            self?.tfMail.resignFirstResponder()
            self?.tfPassword.resignFirstResponder()
        }).subscribe(onNext: {
            if viewModel.validateCredentials() {
                viewModel.login()
            }
        }).disposed(by: disposeBag)
    }
    
    private func animateLogo() {
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [.curveEaseOut], animations: { [weak self] in
            self?.ivLogo.transform = CGAffineTransform(translationX: 0, y: -150)
        }) { [weak self] _ in
            self?.animateForm()
        }
    }
    
    private func animateForm() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseIn], animations: { [weak self] in
            self?.svLogin.alpha = 1.0
        })
    }
}
