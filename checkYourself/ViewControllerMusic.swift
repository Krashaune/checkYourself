//
//  ViewControllerMusic.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/16/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit

class ViewControllerMusic: UIViewController {
    
    var musicPlaylists = ""
    
    @IBOutlet weak var musicLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicLabel.text = musicPlaylists

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
