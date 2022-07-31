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
    
    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setBindings()
    }
    
    private func setUI() {
        navigationItem.titleView = UIImageView(image: Icon.ic_titleview.image)
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
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
        viewModel.getData()
        
        setTableView()
    }
}

extension HomeViewController {
    private func setTableView() {
        guard let viewModel = viewModel else { return }
        
        tableView.register(cell: TitleTableViewCell.self)
        tableView.register(cell: ProductTableViewCell.self)
        
        viewModel.tableViewDelegate.subscribe { [weak self] _ in
            if let delegate = viewModel.tableViewDelegate.value {
                guard let self = self else { return }
                self.tableView.rx.setDelegate(delegate).disposed(by: self.disposeBag)
            }
        }.disposed(by: disposeBag)
        
        viewModel.items.bind(to: tableView.rx.items(dataSource: viewModel.dataSource)).disposed(by: disposeBag)
    }
}
