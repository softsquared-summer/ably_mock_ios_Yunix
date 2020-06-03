//
//  AddDrawerViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class AddDrawerViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var lengthLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet var titleLabel: UILabel!
    
    var rootViewController: FavoriteItemViewController!
    var isAdd: Bool = true
    var index: Int!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        textView.becomeFirstResponder()
        textView.delegate = self
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.contentView.frame.origin.y == 0 {
                self.contentView.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.contentView.frame.origin.y != 0 {
            self.contentView.frame.origin.y = 0
        }
    }

    @IBAction func pressedDone(_ sender: Any) {
        if (textView.text.count > 0) && isAdd {
            rootViewController.receiveAddDrawers(title: textView.text)
        } else if textView.text.count > 0 {
            rootViewController.receiveEditDrawers(title: textView.text, index: 0)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressedCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressedAround(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddDrawerViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        lengthLabel.text = String(textView.text.count)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        return numberOfChars < 31    // 10 Limit Value
    }
}
