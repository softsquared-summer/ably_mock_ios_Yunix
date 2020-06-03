//
//  MarketTableViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class MarketTableViewCell: UITableViewCell {

    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var hashTagLabel: UILabel!
    @IBOutlet var newLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var firstSubImageView: UIImageView!
    @IBOutlet var secondSubImageView: UIImageView!
    @IBOutlet var intenLabel: UILabel!
    
    static let identifier = "MarketTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainImageView.kf.setImage(with: URL(string: imageList.randomElement()!))
        firstSubImageView.kf.setImage(with: URL(string: imageList.randomElement()!))
        secondSubImageView.kf.setImage(with: URL(string: imageList.randomElement()!))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(data: [String] = [], index: Int) {
        if !(data == []) {
            mainImageView.kf.setImage(with: URL(string: data[0]))
            firstSubImageView.kf.setImage(with: URL(string: data[1]))
            secondSubImageView.kf.setImage(with: URL(string: data[2]))
            
            hashTagLabel.text = data[3]
            newLabel.text = data[4]
            nameLabel.text = data[5]
            intenLabel.text = data[6]
        }
        
        rankLabel.text = String(index)
        
        if index > 3 {
            rankLabel.textColor = .black
        }
        
        intenLabel.textColor = .systemRed
    }

}
