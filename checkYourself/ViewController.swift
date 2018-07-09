//
//  ViewController.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/2/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin


var username = SpotifyLogin.shared.username


class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SpotifyLogin.shared.getAccessToken { (token, error) in
            if error != nil, token == nil {
//                self.showLoginFlow(self.spotifyLogin!)
            }
        }
    }
    
    @IBAction func showLoginFlow(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueLogin", sender: self)
    }
    
    var spotifyLogin: UIButton?
    
//    SpotifyLoginPresenter.login(from: self, scopes: [.streaming, .userLibraryRead])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = SpotifyLoginButton(viewController: self,
                                        scopes: [.streaming,
                                                 .userLibraryRead])
        
        self.view.addSubview(button)
        self.spotifyLogin = button
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65).isActive = true
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        spotifyLogin?.center = self.view.center
        
    }

    @objc func loginSuccessful() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

