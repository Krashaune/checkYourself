//
//  ViewControllerWellness.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/5/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin

struct Playlist: Decodable {
    let name: String
    let id: String
}

class ViewControllerWellness: UIViewController {

//    let baseUrl =  "https://api.spotify.com/v1/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getAccessToken()
//        logging flow
        print("wellness view has loaded")
    
        // Do any additional setup after loading the view.
    }
    
//    get the access token for the api calls
//    func getAccessToken(){
//        print("inside the getAccessToken function")
//        SpotifyLogin.shared.getAccessToken {(token, error) in
//            print(token)
//            print("inside get access token function")
//            if error != nil, token == nil {
//                print("there was an error and token was nil")
//                print(error)
//                print("about to reroute to login with spotify")
//                self.showLoginFlow()
//            }
//        }
//    }
    
    func showLoginFlow() {
        print("reroute function called")
        performSegue(withIdentifier: "spotifyLogin", sender: (Any).self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //    classical song -- update to classical playlist
    @IBAction func relax(_ sender: UIButton) {
        guard let url = URL(string:"https://api.spotify.com/v1/users/k33rayt/playlists") else {return}
        
        
        var urlRequest = URLRequest(url: url)
//        urlRequest.setValue("Bearer" + token, forHTTPHeaderField: "Authorization")
        
        urlRequest.setValue("Bearer BQCtb0vNWWwHiqu0jKaUpigMXjlLBzoQw7ESqdJ5H5rpXMDMe4GJrOnoWtgQTjp8m7Bz9FShXA40KJrsP0TpzsEycM1GMfPbae2AEBVrPQCeUGFPh24UN3-eg-XpTpJm4lqF4k74aO6TLInDa8c_dR8cSkW_-BlKVovYxIdwRy_SHw" , forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error   )
                }
            }
            }.resume()
        //        UIApplication.shared.openURL(NSURL(string: "https://open.spotify.com/track/2ZrF3UfwS50CKE8jQQVjWj")! as URL)
        
    }
        
    
        //    R&B song Best Part
//    @IBAction func uplift(_ sender: UIButton) {
//         UIApplication.shared.openURL(NSURL(string: "https://open.spotify.com/track/4OBZT9EnhYIV17t4pGw7ig")! as URL)
//    }
    
        //    Beyonce Party
//    @IBAction func happy(_ sender: UIButton) {
//         UIApplication.shared.openURL(NSURL(string: "https://open.spotify.com/track/42qh86p7TLXyumxSHn65kc")! as URL)
//    }
    
        //    meditation or nature sounds
//    @IBAction func meditate(_ sender: UIButton) {
//         UIApplication.shared.openURL(NSURL(string: "https://open.spotify.com/track/7yRgW5WzxdocmkJxn9h4BP")! as URL)
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

