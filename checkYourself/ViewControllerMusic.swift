//
//  ViewControllerMusic.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/16/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin

class ViewControllerMusic: UIViewController {
    
    var token: String = ""
    var playlistId = ""
    var songs: String = ""
    
    
    
    @IBOutlet weak var musicLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAccessToken()
        let playlist = self.playlistId
        
        guard let url = URL(string:"https://api.spotify.com/v1/users/k33rayt/playlists/\(self.playlistId)/tracks") else {return}
        
        print(url)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        print(urlRequest)
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let response = response {
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                    
                
                    for (key, value) in json {
//                        print(json)
                        
                        if (key == "items") {
                            if let itemsArray:[ [String: Any] ] = value as? [ [String : Any] ] {
                                print ("is array of dict")
                                for track in itemsArray {
                                    for (key, value) in track {
                                        if (key == "track") {
                                            if let trackItems: [String: Any] = value as! [String: Any]{
                                                if (key == "name") {
                                                    print("song name: \(value)")
                                                }
                                            }
                                            
                                            self.songs.append ( value as! String)
                                        }
                                    }
                                    
                                }
                            }
                        }
                        
                    }
                    
                }catch {
                    print(error   )
                }
            }
            }.resume()
        
        musicLabel.text = self.songs
    }
    
    
    
    func getAccessToken(){
        print("inside the getAccessToken function")
        SpotifyLogin.shared.getAccessToken {(token, error) in
            if token != nil {
                self.token = token!
            }
            print(token)
            print("inside get access token function")
            if error != nil, token == nil {
                print("there was an error and token was nil")
                print(error)
                print("about to reroute to login with spotify")
                self.showLoginFlow()
            }
        }
    }
    
    func showLoginFlow() {
        print("reroute function called")
        performSegue(withIdentifier: "spotifyLogin", sender: (Any).self)
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
