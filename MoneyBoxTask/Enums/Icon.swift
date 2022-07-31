//
//  Icon.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit

enum Icon: String {
    case ic_home_tab
    case ic_profile_tab
    case ic_titleview

    var image: UIImage? {
        switch self {
            case .ic_home_tab: return UIImage(named: self.rawValue)
            case .ic_profile_tab: return UIImage(named: self.rawValue)
            case .ic_titleview: return UIImage(named: self.rawValue)
        }
    }
}
