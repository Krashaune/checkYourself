//
//  ViewControllerWellness.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/5/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin

class ViewControllerWellness: UIViewController {

    var playlistName: String = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func relax(_ sender: UIButton) {
        self.playlistName = "3zzUUYkIdkNRrjmNGR3iLD" 
        
    }
    @IBAction func uplift(_ sender: UIButton) {
        self.playlistName = "4HrGgQJO9FUoqhsHthx42l"
        performSegue(withIdentifier: "segueMusic", sender: UIButton.self)
    }
    
    @IBAction func happy(_ sender: UIButton) {
        self.playlistName = "4GaJ65U4qkE7qKJEDrnv0W"
        performSegue(withIdentifier: "segueMusic", sender: UIButton.self)
    }
    
    @IBAction func meditate(_ sender: UIButton) {
        self.playlistName = "37i9dQZF1DX7gIoKXt0gmx"
        performSegue(withIdentifier: "segueMusic", sender: UIButton.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewControllerMusic {
            let vc = segue.destination as? ViewControllerMusic

            vc?.playlistId = playlistName
        }
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


