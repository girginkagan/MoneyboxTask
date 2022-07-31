//
//  HomeViewModel.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class HomeViewModel: BaseViewModel {
    private let network: RestClient
    var coordinator: HomeCoordinator?
    private let disposeBag = DisposeBag()
    let isError = BehaviorSubject<BaseErrorModel?>(value: nil)
    let isLoading = BehaviorSubject<Bool>(value: false)
    let items = BehaviorRelay<[SectionModel<String, ProductResponse?>]>(value: [])
    let tableViewDelegate = BehaviorRelay<UITableViewDelegate?>(value: nil)
    var dataSource: RxTableViewSectionedReloadDataSource<SectionModel<String, ProductResponse?>>!
    var products: ProductsResponseModel?
    
    init(network: RestClient) {
        self.network = network
    }
    
    func setBindings() {
        dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, ProductResponse?>>(
            configureCell: { [weak self] (_, tableView, indexPath, element) in
                switch indexPath.section {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier) as! TitleTableViewCell
                    cell.selectionStyle = .none
                    cell.updateCell(totalPlanValue: self?.products?.totalPlanValue ?? 0.0)
                    
                    return cell
                default:
                    let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier) as! ProductTableViewCell
                    cell.selectionStyle = .none
                    cell.updateCell(data: element)
                    
                    return cell
                }
            }
        )
        tableViewDelegate.accept(self)
    }
    
    func getData() {
        isLoading.onNext(true)
        network.getProducts { [weak self] success in
            self?.isLoading.onNext(false)
            self?.products = success
            self?.items.accept([SectionModel(model: .local(.profile), items: [nil]),
                                SectionModel(model: .local(.profile), items: self?.products?.productResponses ?? [])])
        } errorCompletion: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.isError.onNext(error)
        }
    }
}

extension HomeViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            coordinator?.presentProduct(data: items.value[indexPath.section].items[indexPath.row])
        }
    }
}
