//
//  FavoriteItemViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import SwipeMenuViewController

class FavoriteItemViewController: UIViewController {
    @IBOutlet var contentView: UIView!
    
    var rootViewController: FavoriteViewController!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let favoriteItemCollectionViewCell = UINib(nibName: FavoriteItemCollectionViewCell.identifier, bundle: nil)
               collectionView.register(favoriteItemCollectionViewCell, forCellWithReuseIdentifier: FavoriteItemCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        
//        contentView.addSubview(collectionView)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FavoriteItemViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteItemCollectionViewCell.identifier, for: indexPath) as? FavoriteItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.updateUI()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
