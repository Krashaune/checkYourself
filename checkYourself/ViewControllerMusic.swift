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
    var contextUri = ""
    var dictBody: [String : String] = [:]
    var play = ""
    
    @IBOutlet weak var songTable: UITableView!
    
    
    @IBOutlet weak var playlistImage: UIImageView!
    
    
    
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
                                //                                print(uri)
                                self.songs["name"] = name
                                //                                print(self.songs)
                                self.numOfSongs.append(name)
                                //                                    print(self.numOfSongs)
                                DispatchQueue.main.async {
                                    self.songTable.reloadData()
                                }
                                
                            }
                        }
                    }
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
    
    @IBAction func playPlaylist(_ sender: UIButton) {
        guard let url = URL(string:"https://api.spotify.com/v1/users/k33rayt/playlists/\(self.playlistId)") else {return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        print(urlRequest)
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let response = response {
                
            }
            if let data = data  {
//                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
//                    print(json)
                    
                    for (key,value) in json {
                        if (key == "external_urls"){
                            let url: [String: Any] =  value as! [String: Any]
                            guard let openPlaylist: String = url["spotify"] as? String else {return}
                            self.play.append(openPlaylist)
//                            print(self.play)
                            UIApplication.shared.open(URL(string:self.play)!, options: [:])
                        }
                    }
                    
                }catch {
                    print(error)
                }
            }
            
            
        }.resume()
        
        
    }


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
}

//        this code is an api call to spotify to get the device id
//        this was used to debug the issue where a random song
//            was playing jumping from multiple devices

//        guard let url = URL(string: "https://api.spotify.com/v1/me/player/devices") else {return}
//        var urlRequest = URLRequest(url:url)
//        urlRequest.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
//
//        let session = URLSession.shared
//        session.dataTask(with: urlRequest) { (data, response, error) in
//            if let response = response {
//                print (response)
//            }
//
//            if let data = data {
//                print (data)
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
//                    print (json)
//                } catch  {
//                    print (error)
//                }
//            }
//        }.resume()


//    @IBAction func playButton(_ sender: UIButton) {
////        DispatchQueue.main.async {
////            self.songTable.reloadData()
////        }
//
//        let c = songTable.indexPathForSelectedRow?.item
//        //        index
//        print (c as Any)
////                contextUri += uri[c!]
//        //        name
//        print(self.numOfSongs[c!])
//
//
//        do {
//            let encoder = JSONEncoder()
//            let serializedBody = try encoder.encode(dictBody)
//
//            guard let url = URL(string:"https://api.spotify.com/v1/me/player/play/") else {return}
//
//            var urlRequest = URLRequest(url: url)
//            urlRequest.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
//            urlRequest.httpMethod = "PUT"
//            urlRequest.httpBody = serializedBody
////            urlRequest.httpBody?.append(serializedBody)
//
//            print(urlRequest.allHTTPHeaderFields as Any)
//            print (urlRequest.httpBody as Any)
//            print(urlRequest.httpMethod as Any)
//            print(urlRequest)
//
//            let session = URLSession.shared
//            session.dataTask(with: urlRequest) { (data, response, error) in
//                if let response = response {
//                    print(response)
//                }
//                if let data = data {
//                    do {
////                        print(data)
//                        let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
//                        print(json)
//                    }catch {
//                        print(error)
//                    }
//
//                }
//                }.resume()
//
//
//        } catch let error {
//            print(error)
//        }
//



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


