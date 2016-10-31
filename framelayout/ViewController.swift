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
        // Do any additional setup after loading the view, typically from a nib.
        //let view : UIView = UIView(frame: CGRectMake(100,100,100,100))
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        
        var myArray: Int=0;
        
        greet(person: "deepankur")
        return
        for i in 0 ..< 100 {
            let myView = UIView(frame: CGRect(x: 0, y: myArray, width: Int(screenSize.width - 10), height: 30))
            myView.backgroundColor=UIColor.green
            
            if i%2==0 {
                myView.backgroundColor=UIColor.white
            }else{
                myView.backgroundColor=UIColor.red
            }
            self.view.addSubview(myView)
            myArray=myArray+30;
        }
        
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
        var myArray: Int=0;
        
        
        for i in 0 ..< 6 {
            let myView = UIView(frame: CGRect(x: 0, y: myArray, width: Int(screenSize.width - 10), height: 30))
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
            
            imageView = UIImageView(frame: CGRect(x: 0, y: myArray, width: Int(screenSize.width - 10), height: 50))
            imageView.image = UIImage(named: "glossy")
            //myView.addSubview(imageView)
            
            myArray=myArray+50;
            scrollView.contentSize=CGSize(width:screenSize.width,height : CGFloat(myArray))
            scrollView.addSubview(imageView)
            
        }
        
        imageView = UIImageView(frame: CGRect(x: 0, y: myArray, width: Int(screenSize.width ), height: 500))
        imageView.image = UIImage(named: "asdf")
        
        scrollView.contentSize=CGSize(width:screenSize.width,height : CGFloat(myArray+500))
        scrollView.addSubview(imageView)
        scrollView.delegate=self
        
        return "sup";
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let f: CGFloat=scrollView.contentOffset.y
        NSLog(" %@",  f.description);
    }
}

