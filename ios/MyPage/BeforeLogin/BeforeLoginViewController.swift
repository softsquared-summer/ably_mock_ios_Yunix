//
//  BeforeLoginViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import PMSuperButton

class BeforeLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        view.removeFromSuperview()
        removeFromParent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    @IBAction func pressedLogin(_ sender: PMSuperButton) {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
        navigationController?.navigationBar.setValue(false, forKey: "hidesShadow")
    }
    
    @IBAction func pressedRegister(_ sender: PMSuperButton) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
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
