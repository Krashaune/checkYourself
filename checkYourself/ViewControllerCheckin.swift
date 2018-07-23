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
    var emotionReport: [String] = []
    var currentEmotion: String  =  ""
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return emotions.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.myEmotion.text = emotions[indexPath.item]
        
        if redEmotions.contains(cell.myEmotion.text!){
            cell.backgroundColor = .red
        } else if yellowEmotions.contains(cell.myEmotion.text!) {
            cell.backgroundColor = .yellow
        } else if greenEmotions.contains(cell.myEmotion.text!) {
            cell.backgroundColor = .green
        } else if blueEmotions.contains(cell.myEmotion.text!) {
            cell.backgroundColor = .blue
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
//        print("user has clicked an emotion button")
//        print ("index \(indexPath.item)")
//        print ("emotion \(emotions[indexPath.item])")
        
        emotionReport.append(emotions[indexPath.item])
        currentEmotion = emotions[indexPath.item]
        
        print(currentEmotion)
//        print(emotionReport)
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .full
        
        dateFormatter.timeStyle = .short
        
        let dateString = dateFormatter.string(from: Date())
        print(dateString)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if segue.destination is ViewControllerOptionalRelief {
            let vc = segue.destination as? ViewControllerOptionalRelief
            
            vc?.checkedInEmotion = currentEmotion
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
//        if segue.destination is ViewControllerOptionalRelief {
//            let vc = segue.destination as? ViewControllerOptionalRelief
//
//            vc?.checkedInEmotion = currentEmotion
//        }
//    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
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
