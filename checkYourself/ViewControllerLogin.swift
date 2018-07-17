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

//      Logging the flow
        print ("App Login view has loaded")
        
//        setting button to log in with spotify with scopes defined
        let button = SpotifyLoginButton(viewController: self,
                                        scopes: [.streaming,
                                                 .userLibraryRead, .playlistReadPrivate, .userModifyPlaybackState])
        
        self.view.addSubview(button)
        spotifyLogin = button

//      Designing the button
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65).isActive = true
        
//       SpotifyLoginPresenter.login(from: self, scopes: [.streaming, .userLibraryRead,.playlistReadPrivate])

//      Adding an observer notification for when log in is completed
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loginSuccessful),
            name: .SpotifyLoginSuccessful,
            object: nil
        )
    }
    
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        print("login button clicked")
        
    }
    
    @objc func loginSuccessful() {
        print("logged in successfully")
        self.navigationController?.popViewController(animated: true)
        self.performSegue(withIdentifier: "segueLogin", sender: self)
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
