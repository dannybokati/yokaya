//
//  Slider.swift
//  Yokaya_App
//
//  Created by Danny Bokati on 2/28/18.
//  Copyright © 2018 Gtech Developeres. All rights reserved.
//

import UIKit

class Slider: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageArray = [#imageLiteral(resourceName: "Slide 1"), #imageLiteral(resourceName: "Slide 2"), #imageLiteral(resourceName: "Slide 3")]
        for i in 0..<imageArray.count{
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 0{
            textView.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
        }else if Int(currentPage) == 1{
            textView.text = "I write mobile tutorials mainly targeting iOS"
        }else if Int(currentPage) == 2{
            textView.text = "And sometimes I write games tutorials about Unity"
        }else{
            textView.text = "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email :)"
            // Show the "Let's Start" button in the last slide (with a fade in animation)
            
        }
    }

    

   
}
