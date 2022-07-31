//
//  ProductTableViewCell.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import UIKit

final class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak private var lblMoneybox: UILabel!
    @IBOutlet weak private var lblPlanValue: UILabel!
    @IBOutlet weak private var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateCell(data: ProductResponse?) {
        lblTitle.text = data?.product?.friendlyName
        lblPlanValue.text = .local(.planValue) + "£\(String(data?.planValue ?? 0.0))"
        lblMoneybox.text = .local(.moneybox) + "£\(String(data?.moneybox ?? 0.0))"
    }
}
