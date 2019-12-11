//
//  CommentViewController.swift
//  InstagramTake5
//
//  Created by KATAOKA  HIROTAKA on 2019/12/09.
//  Copyright © 2019 hirotaka.kataoka. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController, UITableViewDelegate {
    var postData: PostData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var textField: UITextField!
    @IBAction func CommentPost(_ sender: Any) {
        let name = Auth.auth().currentUser?.displayName
        
        var text = textField.text!
        
        
       text = "\(name!):\(textField.text!)"
        postData.comments.append(text)
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let comments = ["comments": postData.comments]
        postRef.updateChildValues(comments)
        
         UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
