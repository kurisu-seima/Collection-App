//
//  MemoCreateViewController.swift
//  CollectionApp
//
//  Created by 栗須星舞 on 2020/12/23.
//  Copyright © 2020 星舞. All rights reserved.
//

import UIKit
import RealmSwift

class MemoCreateViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func memoCreateButtonDidTapped(_ sender: Any) {
        let memo = Memo()
        memo.title = titleTextField.text ?? ""
        memo.content = contentTextView.text ?? ""
        memo.id = NSUUID().uuidString
        memo.order = MemoManager.shared.newOrder
        MemoManager.shared.add(memo: memo)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeKeyBoard(_ sender: Any) {
        self.view.endEditing(true)
    }
}
