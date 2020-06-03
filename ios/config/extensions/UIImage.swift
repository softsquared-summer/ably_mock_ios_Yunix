//
//  UIImage.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

let imageList: [String] = ["https://m.heyboo.co.kr/web/product/big/201810/4dadb4304d8718441dc8975bc82cd4ae.jpg", "https://www.uniqueon.co.kr/web/product/big/201908/f9fa200cc35978bd591bbf15e4f590a9.jpg", "https://www.secretlabel.co.kr/shopimages/label55/0510030010082.jpg?1550483308", "https://www.hun-s.com/web/product/big/201904/6c8133279b477084c8d67cfb109fe5b0.jpg", "https://gdimg.gmarket.co.kr/1222832713/still/600?ver=1515563682", "https://image.gsshop.com/image/50/63/50631548_M1.jpg", "https://hotping.co.kr/web/product/big/201808/b4fe8c5929ed1ce8ffc8a6d8011e953b.jpg", "https://fashion-full.com/web/product/big/20200410/7c98ff8bac94d138d543cc5a2d3893f7.jpg", "https://i.pinimg.com/originals/d8/5a/48/d85a482d65ce7b906c20a4ced28e4614.jpg", "https://m.enerzion.co.kr/web/product/big/201909/543795ac8c61a2814ae8e8f91e685d5e.jpg", "https://shop-phinf.pstatic.net/20191023_282/15718185160096JMxC_JPEG/860%28OPS%29%C4%C9%C0%CC_%C8%A6%B8%AF%C7%C3%B7%B9%BE%EEops_MD-%2810%29-%BB%E7%BA%BB.jpg", "https://www.hun-s.com/web/product/big/201904/6c8133279b477084c8d67cfb109fe5b0.jpg", "https://hotping.co.kr/web/product/big/201808/b4fe8c5929ed1ce8ffc8a6d8011e953b.jpg", "https://www.uniqueon.co.kr/web/product/big/201908/f9fa200cc35978bd591bbf15e4f590a9.jpg", "https://i.pinimg.com/originals/d8/5a/48/d85a482d65ce7b906c20a4ced28e4614.jpg", "https://fashion-full.com/web/product/big/20200506/d57a3083e035eee9e2d3787f797e0628.jpg", "https://hotping.co.kr/web/product/big/201907/9f43f5f9493e6c083895218e98cf4481.jpg", "https://m.graysome.com/web/product/big/201902/17660c0433ed78c95565f2cb2df90ab8.jpg", "https://fashion-full.com/web/product/big/20200212/e9f38e4515110cf231ecd9cea4a4ef7e.jpg", "https://fashion-full.com/web/product/big/20200410/7c98ff8bac94d138d543cc5a2d3893f7.jpg", "https://fashion-full.com/web/product/big/20200423/dd48890332e8e2218344556d864dd111.jpg", "https://m.heyboo.co.kr/web/product/big/201810/4dadb4304d8718441dc8975bc82cd4ae.jpg", "https://gdimg.gmarket.co.kr/1222832713/still/600?ver=1515563682", "https://www.secretlabel.co.kr/shopimages/label55/0510030010082.jpg?1550483308", "https://image.gsshop.com/image/50/63/50631548_M1.jpg", "https://m.enerzion.co.kr/web/product/big/201909/543795ac8c61a2814ae8e8f91e685d5e.jpg", "https://shop-phinf.pstatic.net/20191023_282/15718185160096JMxC_JPEG/860%28OPS%29%C4%C9%C0%CC_%C8%A6%B8%AF%C7%C3%B7%B9%BE%EEops_MD-%2810%29-%BB%E7%BA%BB.jpg", "https://www.hun-s.com/web/product/big/201904/6c8133279b477084c8d67cfb109fe5b0.jpg", "https://hotping.co.kr/web/product/big/201808/b4fe8c5929ed1ce8ffc8a6d8011e953b.jpg", "https://www.uniqueon.co.kr/web/product/big/201908/f9fa200cc35978bd591bbf15e4f590a9.jpg", "https://i.pinimg.com/originals/d8/5a/48/d85a482d65ce7b906c20a4ced28e4614.jpg", "https://fashion-full.com/web/product/big/20200506/d57a3083e035eee9e2d3787f797e0628.jpg", "https://hotping.co.kr/web/product/big/201907/9f43f5f9493e6c083895218e98cf4481.jpg", "https://m.graysome.com/web/product/big/201902/17660c0433ed78c95565f2cb2df90ab8.jpg", "https://fashion-full.com/web/product/big/20200212/e9f38e4515110cf231ecd9cea4a4ef7e.jpg", "https://fashion-full.com/web/product/big/20200410/7c98ff8bac94d138d543cc5a2d3893f7.jpg", "https://fashion-full.com/web/product/big/20200423/dd48890332e8e2218344556d864dd111.jpg", "https://m.heyboo.co.kr/web/product/big/201810/4dadb4304d8718441dc8975bc82cd4ae.jpg", "https://gdimg.gmarket.co.kr/1222832713/still/600?ver=1515563682", "https://www.secretlabel.co.kr/shopimages/label55/0510030010082.jpg?1550483308", "https://image.gsshop.com/image/50/63/50631548_M1.jpg", "https://m.heyboo.co.kr/web/product/big/201810/4dadb4304d8718441dc8975bc82cd4ae.jpg", "https://gdimg.gmarket.co.kr/1222832713/still/600?ver=1515563682", "https://www.secretlabel.co.kr/shopimages/label55/0510030010082.jpg?1550483308", "https://image.gsshop.com/image/50/63/50631548_M1.jpg", "https://m.enerzion.co.kr/web/product/big/201909/543795ac8c61a2814ae8e8f91e685d5e.jpg", "https://shop-phinf.pstatic.net/20191023_282/15718185160096JMxC_JPEG/860%28OPS%29%C4%C9%C0%CC_%C8%A6%B8%AF%C7%C3%B7%B9%BE%EEops_MD-%2810%29-%BB%E7%BA%BB.jpg", "https://www.hun-s.com/web/product/big/201904/6c8133279b477084c8d67cfb109fe5b0.jpg", "https://hotping.co.kr/web/product/big/201808/b4fe8c5929ed1ce8ffc8a6d8011e953b.jpg", "https://www.uniqueon.co.kr/web/product/big/201908/f9fa200cc35978bd591bbf15e4f590a9.jpg", "https://i.pinimg.com/originals/d8/5a/48/d85a482d65ce7b906c20a4ced28e4614.jpg", "https://fashion-full.com/web/product/big/20200506/d57a3083e035eee9e2d3787f797e0628.jpg", "https://hotping.co.kr/web/product/big/201907/9f43f5f9493e6c083895218e98cf4481.jpg", "https://m.graysome.com/web/product/big/201902/17660c0433ed78c95565f2cb2df90ab8.jpg", "https://fashion-full.com/web/product/big/20200212/e9f38e4515110cf231ecd9cea4a4ef7e.jpg", "https://fashion-full.com/web/product/big/20200410/7c98ff8bac94d138d543cc5a2d3893f7.jpg", "https://fashion-full.com/web/product/big/20200423/dd48890332e8e2218344556d864dd111.jpg", "https://m.graysome.com/web/product/big/201902/17660c0433ed78c95565f2cb2df90ab8.jpg", "https://fashion-full.com/web/product/big/20200212/e9f38e4515110cf231ecd9cea4a4ef7e.jpg", "https://fashion-full.com/web/product/big/20200423/dd48890332e8e2218344556d864dd111.jpg", "https://hotping.co.kr/web/product/big/201907/9f43f5f9493e6c083895218e98cf4481.jpg", "https://fashion-full.com/web/product/big/20200506/d57a3083e035eee9e2d3787f797e0628.jpg", "https://shop-phinf.pstatic.net/20191023_282/15718185160096JMxC_JPEG/860%28OPS%29%C4%C9%C0%CC_%C8%A6%B8%AF%C7%C3%B7%B9%BE%EEops_MD-%2810%29-%BB%E7%BA%BB.jpg", "https://m.enerzion.co.kr/web/product/big/201909/543795ac8c61a2814ae8e8f91e685d5e.jpg"]

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
    
    static let myHeartf: UIImage? = UIImage(named: "heart")
    static let myHearte: UIImage? = UIImage(named: "Favorite")
    static let myHeartw: UIImage? = UIImage(named: "heartw")
    
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
