//
//  ViewControllerSulk.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/5/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit

class ViewControllerSulk: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide

//        image view
        let img1 = UIImage(named: "redSun")
        slide1.imageView.image = img1
//        slide1.imageView.alpha = 0.8

//        text view
//        let texttextLabel = slide1.texttextLabel(frame: CGRect(x: 0, y: 0, width: 250, height: 200))
//        slide1.textLabel.backgroundColor = UIColor.lightGray
//        slide1.textLabel.alpha = 1

//        slide1.textLabel.font = UIFont.systemFont(ofSize: 24)
//        slide1.textLabel.font = UIFont(name: "Papyrus", size: 24)
//        UIColor(displayP3Red: 114, green: 109, blue: 109, alpha: 1)
        
        slide1.textLabel.text = "Make a commitment that today you will not worry about anything. You will allow life to flow without expectation or judgement."
        
        
    
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "blueflowers")
        slide2.textLabel.text = "A real-life bear"
        
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "feather")
        slide3.textLabel.text = "A real-life bear"
        
        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 40, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: 600)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    var slides:[Slide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        
        view.bringSubview(toFront: pageControl)
        
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
