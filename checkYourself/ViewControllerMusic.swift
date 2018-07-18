//
//  ViewControllerMusic.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/16/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin

class ViewControllerMusic: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfSongs.count
    }
    
    var token: String = ""
    var playlistId = ""
    var songs: [String: String] = ["name": ""]
    var numOfSongs: [String] = []
    var names: [String] = []
    var uri: [String] = []
    
    @IBOutlet weak var songTable: UITableView!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        getAccessToken()
        let playlist = self.playlistId
        
        guard let url = URL(string:"https://api.spotify.com/v1/users/k33rayt/playlists/\(self.playlistId)/tracks") else {return}
     
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        print(urlRequest)
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let response = response {
            }
            
            if let data = data  {
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                    let itemsArray:[ [String: Any] ] = json["items"] as! [ [String : Any] ]
                    
                    for track in itemsArray {
                        for (key, value) in track {
                            if (key == "track") {
                                let trackItems: [String: Any] = value as! [String: Any]
                                guard let name: String = trackItems["name"] as? String else {return}
                                guard let uri: String = trackItems["uri"] as? String else {return}
                                self.uri.append(uri)
                                print(uri)
                                self.songs["name"] = name
//                                print(self.songs)
                                self.numOfSongs.append(name)
//                                print(self.numOfSongs)
                                DispatchQueue.main.async {
                                    self.songTable.reloadData()
                                }
                                
                            }
                        }
                    }
//                    self.songTable.reloadData()
                }catch {
                    print(error)
                }
            }
            }.resume()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as! TableViewCellSong
        let text = self.numOfSongs[indexPath.row]
        cell.songName.text = text
        
        return cell
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = songTable.cellForRow(at: indexPath) as! TableViewCellSong
        print("I am next \(String(describing: cell.songName.text))")
    }
    
    
    
    func getAccessToken(){
        SpotifyLogin.shared.getAccessToken {(token, error) in
            if token != nil {
                self.token = token!
            }

            if error != nil, token == nil {
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
