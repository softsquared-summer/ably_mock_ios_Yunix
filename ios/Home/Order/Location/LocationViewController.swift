//
//  LocationViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class LocationViewController: BaseViewController {

    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var postNumberTextfield: UITextField!
    @IBOutlet var adressTextfield: UITextField!
    @IBOutlet var moreadressTextfield: UITextField!
    @IBOutlet var phoneNumberTextfield: UITextField!
    
    var locationData: [String] = []
    var rootViewController: OrderViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "배송지 입력"
        // Do any additional setup after loading the view.
    }

    @IBAction func pressedButton(_ sender: Any) {
        locationData.append(nameTextfield.text!)
        locationData.append(postNumberTextfield.text!)
        locationData.append(adressTextfield.text!)
        locationData.append(moreadressTextfield.text!)
        locationData.append(phoneNumberTextfield.text!)
        rootViewController.doneLoctaion(data: locationData)
        self.navigationController?.popViewController(animated: true)
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
