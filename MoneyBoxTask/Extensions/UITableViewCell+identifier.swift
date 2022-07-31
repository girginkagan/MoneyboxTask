//
//  UITableViewCell+identifier.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import UIKit

public extension UITableViewCell {
    static var identifier: String {
        return String(describing: self.self)
    }
}
