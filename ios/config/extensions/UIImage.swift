//
//  UIImage.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

extension UIImage {
    static let homePink: UIImage? = UIImage(named: "homePink")
    static let homeGray: UIImage? = UIImage(named: "homeGray")
    static let stylePink: UIImage? = UIImage(named: "stylePink")
    static let styleGray: UIImage? = UIImage(named: "styleGray")
    static let marketPink: UIImage? = UIImage(named: "marketPink")
    static let marketGray: UIImage? = UIImage(named: "marketGray")
    static let favoritePink: UIImage? = UIImage(named: "favoritePink")
    static let favoriteGray: UIImage? = UIImage(named: "favoriteGray")
    static let myPagePink: UIImage? = UIImage(named: "myPagePink")
    static let myPageGray: UIImage? = UIImage(named: "myPageGray")
    static let search: UIImage? = UIImage(named: "search")
    static let shoppingCar: UIImage? = UIImage(named: "shoppingCar")
    
    func resize(ratio: CGFloat) -> UIImage {
        let size = self.size
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
