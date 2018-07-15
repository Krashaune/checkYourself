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
                                                 .userLibraryRead, .playlistReadPrivate])
        
        self.view.addSubview(button)
        spotifyLogin = button

//      Designing the button
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65).isActive = true
        
//       get the access token for the api calls
        print("about to call the getAccessToken function")
        
        SpotifyLogin.shared.getAccessToken {(token, error) in
            print(token)
            print("inside get access token function")
            if error != nil, token == nil {
                print("there was an error and token was nil")
                print(error)
                print("about to reroute to login with spotify")
                self.showLoginFlow()
            }
        }

//      Adding an observer notification for when log in is completed
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loginSuccessful),
            name: .SpotifyLoginSuccessful,
            object: nil
        )
    }
    
    func showLoginFlow() {
        print("reroute function called")
        performSegue(withIdentifier: "spotifyLogin", sender: (Any).self)
    }
    
    @IBAction func didTapLogin(_ sender:UIButton) {
        print("login button clicked")
        SpotifyLoginPresenter.login(from: self, scopes: [.streaming, .userLibraryRead,.playlistReadPrivate])
        
    }
    
    @objc func loginSuccessful() {
        print("logged in successfully")
        self.navigationController?.popViewController(animated: true)
//        self.performSegue(withIdentifier: "segueLogin", sender: self)
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
