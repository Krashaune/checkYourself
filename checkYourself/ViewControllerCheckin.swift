//
//  ViewControllerCheckin.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/3/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit

class ViewControllerCheckin: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
     let emotions = ["Enraged","Furious", "Fustrated", "Shocked", "Livid", "Frightened", "Nervous", "Restless", "Fuming", "Apprehensive", "Worried", "Annoyed", "Repulsed", "Troubled", "Uneasy", "Peeved"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emotions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.myEmotion.text = emotions[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print (indexPath.item)
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
