//
//  InputUserInfoViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Alamofire

class InputUserInfoViewController: BaseViewController {

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var rePasswordTextfield: UITextField!
    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var phoneNumberTextfield: UITextField!
    @IBOutlet var birthTextfield: UITextField!
    
    @IBOutlet var allCheckImage: UIImageView!
    @IBOutlet var serviceCheckImage: UIImageView!
    @IBOutlet var privateCheckImage: UIImageView!
    
    let datePicker = UIDatePicker()
    var date: String!
    
    var isAllCheck = false
    var isServiceCheck = false
    var isPrivateCheck = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        allCheckImage.isHidden = true
        serviceCheckImage.isHidden = true
        privateCheckImage.isHidden = true
        
        showDatePicker()
        passwordTextfield.isSecureTextEntry = true
        rePasswordTextfield.isSecureTextEntry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "가입하기"
        navigationController?.navigationBar.setValue(false, forKey: "hidesShadow")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor(hex: 0x777777, alpha: 1)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = nil
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
     func showDatePicker(){
           //Formate Date
           datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KO")
        datePicker.backgroundColor = UIColor(hex: 0xFFFFFF, alpha: 1)
          //ToolBar
          let toolbar = UIToolbar();
          toolbar.sizeToFit()
          let doneButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
         let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)

         birthTextfield.inputAccessoryView = toolbar
         birthTextfield.inputView = datePicker

        }

         @objc func donedatePicker(){

          let formatter = DateFormatter()
          formatter.dateFormat = "yyyy/MM/dd"
            let dateTextList = formatter.string(from: datePicker.date).split(separator: "/")
            date = "\(dateTextList[0])\(dateTextList[1])\(dateTextList[2])"
            let dateTextIntList = dateTextList.map{Int($0)!}
            let dateText = "\(dateTextIntList[0])년 \(dateTextIntList[1])월 \(dateTextIntList[2])일"
          birthTextfield.text = dateText
          self.view.endEditing(true)
        }

        @objc func cancelDatePicker(){
           self.view.endEditing(true)
         }
    
    @IBAction func pressedAllCheck(_ sender: Any) {
        isAllCheck = !isAllCheck
        isServiceCheck = isAllCheck
        isPrivateCheck = isAllCheck
        
        allCheckImage.isHidden = !isAllCheck
        serviceCheckImage.isHidden = !isAllCheck
        privateCheckImage.isHidden = !isAllCheck
    }
    
    @IBAction func pressedServiceCheck(_ sender: Any) {
        isServiceCheck = !isServiceCheck
        isAllCheck = isServiceCheck && isPrivateCheck
        
        serviceCheckImage.isHidden = !isServiceCheck
        allCheckImage.isHidden = !(isServiceCheck && isPrivateCheck)
    }
    
    @IBAction func pressedPrivateCheck(_ sender: Any) {
        isPrivateCheck = !isPrivateCheck
        isAllCheck = isServiceCheck && isPrivateCheck
        
        privateCheckImage.isHidden = !isPrivateCheck
        allCheckImage.isHidden = !(isServiceCheck && isPrivateCheck)
    }
    
    @IBAction func pressedRegister(_ sender: Any) {
        if date == nil {
            date = ""
        }
        
        let parameters: Parameters = Parameters(dictionaryLiteral: ("userType", "NORMAL"),
                                                ("email", emailTextfield.text!),
                                                ("password", passwordTextfield.text!),
                                                ("name", nameTextfield.text!),
                                                ("phone", phoneNumberTextfield.text!),
                                                ("dateOfBirth", date!),
                                                ("AgreeOnService", isServiceCheck ? "Y" : "N"),
                                                ("AgreeOnPrivate", isPrivateCheck ? "Y" : "N"))
        print(parameters)
        RegisterDataManager().postRegister(self, parameters)
    }
    
    func registerSuccess() {
        navigationController?.navigationBar.isHidden = false
        let alert = UIAlertController(title: "회원가입 성공", message: nil, preferredStyle: .alert)
        let actionOkay = UIAlertAction(title: "확인", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(actionOkay)

        present(alert, animated: true, completion: nil)
    }
    
    func registerFailed(failedMessage : String!) {
        let alert = UIAlertController(title: failedMessage, message: nil, preferredStyle: .alert)
        let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(actionOkay)

        present(alert, animated: true, completion: nil)
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
