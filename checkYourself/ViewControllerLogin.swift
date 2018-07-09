//
//  ViewControllerLogin.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/9/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin


var spotifyLogin: UIButton?

class ViewControllerLogin: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("Ive loaded")
        
        let button = SpotifyLoginButton(viewController: self,
                                        scopes: [.streaming,
                                                 .userLibraryRead])
        
        self.view.addSubview(button)
        spotifyLogin = button
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65).isActive = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_sender: UIButton) {
        SpotifyLoginPresenter.login(from: self, scopes: [.streaming, .userLibraryRead])
        print ("button clicked")
    }
    
    @objc func loginSuccessful() {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
