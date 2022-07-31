//
//  Color.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit

enum Color: String {
    case color_primary
    case color_white
    case AccentColor
    case color_accent
    case color_tabbar_bg
    case color_bg

    var color: UIColor? {
        switch self {
            case .color_primary: return UIColor(named: self.rawValue)
            case .color_white: return UIColor(named: self.rawValue)
            case .AccentColor: return UIColor(named: self.rawValue)
            case .color_accent: return UIColor(named: self.rawValue)
            case .color_tabbar_bg: return UIColor(named: self.rawValue)
            case .color_bg: return UIColor(named: self.rawValue)
        }
    }
}
