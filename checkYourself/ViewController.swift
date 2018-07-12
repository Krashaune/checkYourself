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
            print(token)
            print(error)
            
            if error != nil, token == nil {
                self.showLoginFlow(spotifyLogin!)
            }
            
            
        }
    }
    
    func showLoginFlow(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueLogin", sender: self)
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

