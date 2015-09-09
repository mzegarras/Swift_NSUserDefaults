//
//  ViewController.swift
//  preferencias
//
//  Created by Manuel Zegarra on 8/09/15.
//  Copyright (c) 2015 M-Sonic. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtValor: UITextField!
    
    @IBOutlet weak var lblValor: UILabel!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var valor = userDefaults.integerForKey("PARAM");
        
        if valor==0 {
            lblValor.text =  "Sin valor";
        }else{
            lblValor.text =  "\(valor)";
        }
        
        
        
        
        txtValor.keyboardType = UIKeyboardType.NumberPad
        txtValor.returnKeyType = UIReturnKeyType.Done
        
        txtValor.delegate = self;
        
    }
    
  
    

    @IBAction func btnClick(sender: UIButton) {
        
        var valor = txtValor.text.toInt()
        
        userDefaults.setInteger(valor!, forKey: "PARAM")
        
        
    }
    
    
    @IBAction func btnBorrar(sender: UIButton) {
        userDefaults.removeObjectForKey("PARAM")
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //self.view.endEditing(true)
        textField.resignFirstResponder();
        return false
    }
    
}

