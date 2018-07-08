//
//  ViewController.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/2/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin


var username = ""


class ViewController: UIViewController {

   
    @IBOutlet weak var loginOutlet: UITextField!

    @IBAction func login(_ sender: UIButton) {
        if (loginOutlet.text != "") {
           username = loginOutlet.text!
            performSegue(withIdentifier: "segueLogin", sender: self)
        }

    }
    
    @IBOutlet weak var spotifyLogin: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = SpotifyLoginButton(viewController: self,
                                        scopes: [.streaming,
                                                 .userLibraryRead])
        
        self.view.addSubview(button)
        self.spotifyLogin = button
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        spotifyLogin?.center = self.view.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

