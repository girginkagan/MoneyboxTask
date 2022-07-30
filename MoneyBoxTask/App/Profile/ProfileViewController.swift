//
//  ProfileViewController.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit
import RxSwift

final class ProfileViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.profile
    var viewModel: ProfileViewModel?
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak private var btnLogout: UIButton!
    @IBOutlet weak private var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        lblTitle.text = .local(.profile)
        btnLogout.setTitle(.local(.logout), for: .normal)
        
        btnLogout.rx.tap.subscribe { [weak self] _ in
            self?.viewModel?.logout()
        }.disposed(by: disposeBag)
    }
}
