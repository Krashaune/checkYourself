//
//  ViewControllerCheckin.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/3/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit

let redEmotions = ["Enraged","Furious", "Fustrated", "Shocked", "Livid", "Frightened", "Nervous", "Restless", "Fuming", "Apprehensive", "Worried", "Annoyed", "Repulsed", "Troubled", "Uneasy", "Peeved"]

let yellowEmotions = ["Surprised", "Upbeat", "Motivated", "Ecstatic", "Hyper", "Cheerful", "Inspired", "Elated", "Energized", "Lively", "Optimistic", "Thrilled", "Pleasant", "Joyful", "Proud", "Blissful"]

let greenEmotions = ["Blessed", "At Ease", "Content", "Fulfilled", "Humble", "Secure", "Chill", "Grateful", "Calm", "Satisfied", "Relaxed", "Carefree", "Relieved", "Restful", "Tranquil", "Serene"]

let blueEmotions = ["Disgusted", "Disappointed", "Glum", "Ashamed", "Mortified", "Alienated", "Mopey", "Apathetic", "Embarrassed", "Excluded", "Timid", "Drained", "Alone", "Down", "Bored", "Tired"]

let emotions = ["Enraged","Furious", "Fustrated", "Shocked", "Livid", "Frightened", "Nervous", "Restless", "Fuming", "Apprehensive", "Worried", "Annoyed", "Repulsed", "Troubled", "Uneasy", "Peeved", "Surprised", "Upbeat", "Motivated", "Ecstatic", "Hyper", "Cheerful", "Inspired", "Elated", "Energized", "Lively", "Optimistic", "Thrilled", "Pleasant", "Joyful", "Proud", "Blissful", "Blessed", "At Ease", "Content", "Fulfilled", "Humble", "Secure", "Chill", "Grateful", "Calm", "Satisfied", "Relaxed", "Carefree", "Relieved", "Restful", "Tranquil", "Serene", "Disgusted", "Disappointed", "Glum", "Ashamed", "Mortified", "Alienated", "Mopey", "Apathetic", "Embarrassed", "Excluded", "Timid", "Drained", "Alone", "Down", "Bored", "Tired"]

class ViewControllerCheckin: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return emotions.count
    }
    
    
//    var sections = ["red", "yellow", "blue", "green"]
//
//    var combined : NSMutableArray!
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        var reuseable : UICollectionReusableView? = nil
//        if(kind == UICollectionElementKindSectionHeader)
//        {
//            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "reuseable", for: indexPath) as! CollectionReusableView
//
//            view.headerText.text = sections[indexPath.section]
//
//            reuseable = view
//            return reuseable!
//            
//        }
//        return reuseable!
//    }
//

    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return sections.count
//    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
//    {
//        return (combined.object(at: section) as! NSArray).count
//
//    }
//
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.myEmotion.text = emotions[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print (indexPath.item)
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        combined.addObjects(from: [redEmotions,yellowEmotions,blueEmotions,greenEmotions])

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
