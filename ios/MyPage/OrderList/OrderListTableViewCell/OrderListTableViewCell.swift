//
//  OrderListTableViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var orderImageView: UIImageView!
    @IBOutlet var orderStatusLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var firstOptionLabel: UILabel!
    @IBOutlet var secondOptionLabel: UILabel!
    
    var data: OrderListResponseProductInfo!
    
    static let identifier = "OrderListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(data: OrderListResponseProductInfo!, date: String!) {
        self.data = data!
        
        dateLabel.text = date
        orderImageView.kf.setImage(with: URL(string: data.thumbnailUrl))
        orderStatusLabel.text = data.statusName
        priceLabel.text = data.detailedPrice.components(separatedBy: ["원"]).joined()
        contentLabel.text = data.productName
        firstOptionLabel.text = data.firstOption
        secondOptionLabel.text = data.secondOption
    }
}
