//
//  editViewController.swift
//  seguePractice
//
//  Created by Albert on 2018/8/15.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import UIKit

class editViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var information: Information = Information()
    
    var row = 0
    
    @IBOutlet var editTitle: UITextField!
    
    @IBOutlet var editContent: UITextView!
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "saveBackTVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editInformation = Information(title: editTitle.text!, content: editContent.text!)
        print(editInformation)
        
        if segue.identifier == "saveBackTVC" {
            let etvc = segue.destination as! TableViewController
            print(123)
            etvc.information[row] = editInformation
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let next = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            next.becomeFirstResponder()
        }
        return false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTitle.text = information.title
        editContent.text = information.content
        editTitle.becomeFirstResponder()
        
        editTitle.tag = 0
        editContent.tag = 1
        editTitle.placeholder = "Key in anything..."
        editTitle.font = UIFont(name: "Helvetica-Light", size: 35)
        editTitle.autocapitalizationType = .words
        editTitle.clearButtonMode = .whileEditing
        
        editContent.font = UIFont(name: "Helvetica-Light", size: 25)
        editContent.textColor = .white
        editContent.autocapitalizationType = .sentences
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
