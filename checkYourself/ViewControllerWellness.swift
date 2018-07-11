//
//  ViewControllerWellness.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/5/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit

class ViewControllerWellness: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    classical song -- update to classical playlist
    @IBAction func relax(_ sender: UIButton) {
        UIApplication.shared.openURL(NSURL(string: "https://open.spotify.com/track/2ZrF3UfwS50CKE8jQQVjWj")! as URL)
        
    }
    
//    R&B song Best Part
    @IBAction func uplift(_ sender: UIButton) {
         UIApplication.shared.openURL(NSURL(string: "https://open.spotify.com/track/4OBZT9EnhYIV17t4pGw7ig")! as URL)
    }
    
//    Beyonce Party
    @IBAction func happy(_ sender: UIButton) {
         UIApplication.shared.openURL(NSURL(string: "https://open.spotify.com/track/42qh86p7TLXyumxSHn65kc")! as URL)
    }
    
//    meditation or nature sounds
    @IBAction func meditate(_ sender: UIButton) {
         UIApplication.shared.openURL(NSURL(string: "https://open.spotify.com/track/7yRgW5WzxdocmkJxn9h4BP")! as URL)
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
