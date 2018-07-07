//
//  ViewController.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/2/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit


var username = ""


class ViewController: UIViewController {

   
    @IBOutlet weak var loginOutlet: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
        if (loginOutlet.text != "") {
           username = loginOutlet.text!
            performSegue(withIdentifier: "segueLogin", sender: self)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

