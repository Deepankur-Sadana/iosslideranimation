//
//  ViewController.swift
//  framelayout
//
//  Created by Deepankur on 10/31/16.
//  Copyright © 2016 Deepankur. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greet(person: "deepankur")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func greet(person: String) -> String {
        var scrollView: UIScrollView
        var imageView: UIImageView
        
        
        imageView = UIImageView(image: UIImage(named: "image.png"))
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.lightGray
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = [ UIViewAutoresizing.flexibleWidth , UIViewAutoresizing.flexibleHeight]
        
        //scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        let screenSize: CGRect = UIScreen.main.bounds
        var topMargin: Int=0;
        
        
        for i in 0 ..< 6 {
            let myView = UIView(frame: CGRect(x: 0, y: topMargin, width: Int(screenSize.width - 10), height: 30))
            myView.backgroundColor=UIColor.green
            
            if i%2==0 {
                myView.backgroundColor=UIColor.white
            }else{
                myView.backgroundColor=UIColor.red
            }
            
            if i==99{
                myView.backgroundColor=UIColor.magenta
            }
            
            let imageView:UIImageView
            
            imageView = UIImageView(frame: CGRect(x: 0, y: topMargin, width: Int(screenSize.width - 10), height: 50))
            imageView.image = UIImage(named: "glossy")
            
            topMargin=topMargin+50;
            scrollView.contentSize=CGSize(width:screenSize.width,height : CGFloat(topMargin))
            scrollView.addSubview(imageView)
        }
        
        imageView = UIImageView(frame: CGRect(x: 0, y: topMargin, width: Int(screenSize.width ), height: 500))
        imageView.image = UIImage(named: "asdf")
        
        scrollView.contentSize=CGSize(width:screenSize.width,height : CGFloat(topMargin+500))
        scrollView.addSubview(imageView)
        scrollView.delegate=self
        return "sup";
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let f: CGFloat=scrollView.contentOffset.y
        NSLog(" %@",  f.description);
    }
}

