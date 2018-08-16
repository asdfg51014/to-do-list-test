//
//  addViewController.swift
//  seguePractice
//
//  Created by Albert on 2018/8/15.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import UIKit

class addViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var information: Information = Information()
    
    @IBOutlet var addTitle: UITextField!
    
    @IBOutlet var addContent: UITextView!
    
    
    
    @IBAction func addSave(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "saveToTVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addInformation = Information(title: addTitle.text!, content: addContent.text!)
        if segue.identifier == "saveToTVC" {
            let tvc = segue.destination as! TableViewController
            
            tvc.information.append(addInformation)
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
        
        addTitle.text = information.title
        addContent.text = information.content
        addTitle.becomeFirstResponder()
        
        addTitle.tag = 0
        addContent.tag = 1
        addTitle.placeholder = "Key in anything..."
        addTitle.font = UIFont(name: "Helvetica-Light", size: 35)
        addTitle.autocapitalizationType = .words
        addTitle.clearButtonMode = .whileEditing
        
        addContent.font = UIFont(name: "Helvetica-Light", size: 25)
        addContent.textColor = .white
        addContent.autocapitalizationType = .sentences
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
