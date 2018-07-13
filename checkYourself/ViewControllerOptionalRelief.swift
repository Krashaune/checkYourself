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

    @IBOutlet weak var checkedEmotion: UILabel!

    @IBOutlet weak var btnRelief: UIButton!
    
    @IBOutlet weak var btnSulk: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        checkedEmotion.text = "You checked in as feeling..." 
        btnRelief.layer.cornerRadius = 10
        btnSulk.layer.cornerRadius = 10
        
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
