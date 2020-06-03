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
    
    var data: [DrawersResponseResult] = []
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func editDrawers(index: Int, string: String, indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let actionDelete = UIAlertAction(title: "서랍 삭제", style: .destructive) { (action) in
            if !(userToken == nil) {
                DeleteDrawersDataManager().delteDrawers(self, name: string, indexPath: indexPath)
            } else {
                let alert = UIAlertController(title: "로그인이 필요한 기능입니다.", message: nil, preferredStyle: .alert)
                let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
                
                alert.addAction(actionOkay)

                self.rootViewController.present(alert, animated: true, completion: nil)
            }
            
        }
        let actionEditName = UIAlertAction(title: "서랍 이름 변경", style: .default) { (action) in
            if !(userToken == nil) {
                let addDrawerStoryboard = UIStoryboard(name: "AddDrawer", bundle: Bundle.main)
                guard let addDrawer = addDrawerStoryboard
                    .instantiateViewController(withIdentifier: "AddDrawer") as? AddDrawerViewController else {
                    return
                }
                
                addDrawer.rootViewController = self
                addDrawer.modalPresentationStyle = .custom
                addDrawer.modalTransitionStyle = .crossDissolve
                self.present(addDrawer, animated: true, completion: nil)
                addDrawer.isAdd = false
                addDrawer.textView.text = string
                addDrawer.titleLabel.text = "서랍 이름 바꾸기"
                addDrawer.index = index
            } else {
                let alert = UIAlertController(title: "로그인이 필요한 기능입니다.", message: nil, preferredStyle: .alert)
                let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
                
                alert.addAction(actionOkay)

                self.rootViewController.present(alert, animated: true, completion: nil)
            }
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionEditName)
        alert.addAction(actionDelete)

        present(alert, animated: true, completion: nil)
    }
    
    func successDelete(indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
        collectionView.reloadData()
    }
    
    func receiveAddDrawers(title: String!) {
        AddDrawersDataManager().postDrawers(self, name: title)
    }
    
    func receiveEditDrawers(title: String!, index: Int!) {
        data[index].drawerName = title
        collectionView.reloadData()
    }
    
    func successAddDrawers() {
        DrawersDataManager().getDrawers(self)
    }
    
    func receiveDrawers(data: [DrawersResponseResult]!) {
        self.data = data
        self.collectionView.reloadData()
    }

    @IBAction func pressedAddDrawersButton(_ sender: Any) {
        if !(userToken == nil) {
            let addDrawerStoryboard = UIStoryboard(name: "AddDrawer", bundle: Bundle.main)
            guard let addDrawer = addDrawerStoryboard
                .instantiateViewController(withIdentifier: "AddDrawer") as? AddDrawerViewController else {
                return
            }
            
            addDrawer.rootViewController = self
            addDrawer.modalPresentationStyle = .custom
            addDrawer.modalTransitionStyle = .crossDissolve
            self.present(addDrawer, animated: true, completion: nil)
            addDrawer.textView.text = ""
        } else {
            let alert = UIAlertController(title: "로그인이 필요한 기능입니다.", message: nil, preferredStyle: .alert)
            let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.addAction(actionOkay)

            self.present(alert, animated: true, completion: nil)
        }
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
        if data.count == 0 {
            return 10
        } else {
            return data.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteItemCollectionViewCell.identifier, for: indexPath) as? FavoriteItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if data.count == 0 {
            cell.updateUI()
        } else {
            cell.updateDrawersUI(data: data[indexPath.row], indexPath: indexPath)
            cell.rootViewController = self
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        rootViewController.navigationController?.pushViewController(FavoriteItemInfoViewController(), animated: true)
    }
    
}
