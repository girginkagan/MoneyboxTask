//
//  UITableView+register.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import UIKit

extension UITableView {
    func register(cell: UITableViewCell.Type) {
        let bundle = Bundle(for: cell.self)
        let nib = UINib(nibName: cell.identifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: cell.identifier)
    }
}
