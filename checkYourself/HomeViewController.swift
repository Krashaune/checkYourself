//
//  HomeViewController.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/2/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin

var username = SpotifyLogin.shared.username

class HomeViewController: UIViewController {

    
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    @IBOutlet weak var Home: UIView!
    
    @IBOutlet weak var name: UILabel!
    
    var hamburgerMenuIsVisible = false
    
    @IBAction func hamburgerBtnTapped(_ sender: UIBarButtonItem) {
        if !hamburgerMenuIsVisible {
            leading.constant = 150
            trailing.constant = -150
            
            hamburgerMenuIsVisible = true
        } else {
            leading.constant = 0
            trailing.constant = 0
            
            hamburgerMenuIsVisible = false
        }
    }
    @IBAction func didTapLogOut(_ sender: UIButton) {
        SpotifyLogin.shared.logout()
        performSegue(withIdentifier: "spotifyLogout", sender: UIButton.self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "Hello !"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
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
