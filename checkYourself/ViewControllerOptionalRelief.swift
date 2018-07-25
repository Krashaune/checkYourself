//
//  ViewControllerOptionalRelief.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/3/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin

class ViewControllerOptionalRelief: UIViewController {
   
    var checkedInEmotion: String?
    
    @IBOutlet weak var checkedEmotion: UILabel!

    @IBOutlet weak var btnRelief: UIButton!
    
    @IBOutlet weak var btnSulk: UIButton!
    
   
    var hamburgerMenuIsVisible = false
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    @IBAction func hamburgerbtntapped(_ sender: UIButton) {
        if !hamburgerMenuIsVisible {
            leading.constant = -150
            trailing.constant = 150
            
            hamburgerMenuIsVisible = true
        } else {
            leading.constant = 0
            trailing.constant = 0
            
            hamburgerMenuIsVisible = false
        }
        
    }
    @IBAction func logout(_ sender: UIButton) {
        SpotifyLogin.shared.logout()
        performSegue(withIdentifier: "spotifyLogout", sender: UIButton.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("about to print checked in emotion")
        print(checkedInEmotion)
        print("after checked in emotion is printed")
//        checkedEmotion.text = checkedInEmotion
        
//        btnRelief.layer.cornerRadius = 10
//        btnSulk.layer.cornerRadius = 10
        
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
