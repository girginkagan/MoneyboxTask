//
//  TitleTableViewCell.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import UIKit

final class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak private var lblTotalPlanValue: UILabel!
    @IBOutlet weak private var lblName: UILabel!
    
    let userData = DataProvider.shared.user.value?.userData
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateCell(totalPlanValue: Double) {
        lblName.text = .local(.welcome) + "\n\(userData?.firstName ?? "") \(userData?.lastName ?? "")"
        lblTotalPlanValue.text = .local(.totalPlanValue) + "£\(String(totalPlanValue))"
    }
}
