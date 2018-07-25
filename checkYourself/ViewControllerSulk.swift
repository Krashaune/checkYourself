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
        slide1.imageView.image = UIImage(named: "redSun")
        slide1.textLabel.text = "Make a commitment that today you will not worry about anything. You will allow life to flow without expectation or judgement."
        slide1.textLabel.textColor = .black
        
        
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "blueflowers")
        slide2.textLabel.text = "Relax. You are not a finished product. Give yourself sometime to grow into yourself."
        slide2.textLabel.textColor = .black
        
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "featherWater")
        slide3.textLabel.text = "No such thing as a life thats better than yours. No such thing, no such thing           -J.Cole"
        slide3.textLabel.textColor = .black
        
        
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
