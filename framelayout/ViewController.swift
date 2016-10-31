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
    let screenSize: CGRect = UIScreen.main.bounds
    func greet(person: String) -> String {
        var scrollView: UIScrollView
        var imageView: UIImageView
        
        imageView = UIImageView(image: UIImage(named: "image.png"))
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.lightGray
        scrollView.autoresizingMask = [ UIViewAutoresizing.flexibleWidth , UIViewAutoresizing.flexibleHeight]
        view.addSubview(scrollView)
        
        let topMargin : Int=generateAndAddTabs(scrollView: scrollView)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: topMargin, width: Int(screenSize.width ), height: 500))
        imageView.image = UIImage(named: "asdf")
        
        scrollView.contentSize=CGSize(width:screenSize.width,height : CGFloat(topMargin+500))
        scrollView.addSubview(imageView)
        scrollView.delegate=self
        return "sup";
        
    }
    
    var viewList = [UIImageView]()
    
    let TAB_COUNT : Int=10;
    let TOTAL_HEIGHT_OF_TAB:Int = 50;
    //let SCROLL_VIEW_TOP_MARGIN:Int = 50;
    
    
    func generateAndAddTabs(scrollView : UIScrollView) -> Int {
        
        let screenSize: CGRect = UIScreen.main.bounds
        var topMargin: Int = (TAB_COUNT-1) * TOTAL_HEIGHT_OF_TAB;
        
        
        for i in 0 ..< TAB_COUNT {
            let imageView:UIImageView
            imageView = UIImageView(frame: CGRect(x: 0, y: topMargin, width: Int(screenSize.width - 0), height: TOTAL_HEIGHT_OF_TAB))
            imageView.image = UIImage(named: "glossy")
            
            topMargin=topMargin-TOTAL_HEIGHT_OF_TAB;
            scrollView.contentSize=CGSize(width:screenSize.width,height : CGFloat(topMargin))
            addToList(im: imageView)
            scrollView.addSubview(imageView)
        }
        return TAB_COUNT * TOTAL_HEIGHT_OF_TAB;
    }
    
    func addToList(im: UIImageView)  {
        viewList.append( im)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let f: CGFloat=scrollView.contentOffset.y
        NSLog(" %@",  f.description);
        resetTopMargins(currentOffset: f)
    }
    
    func resetTopMargins(currentOffset: CGFloat)  {
        for i in 0..<viewList.count {
            let imageView:UIImageView = viewList[i];
            let translationForLoopingTab:Int=getMarginForTab(index: i, scrollY: Int(currentOffset))
            
            if i>0 {
            imageView.frame = CGRect(x: 0,y: translationForLoopingTab,width: Int(screenSize.width),height: TOTAL_HEIGHT_OF_TAB );
            }
        }
    }
    
    func getOriginalTopMargin(index:Int) -> Int{
    return (TOTAL_HEIGHT_OF_TAB*(TAB_COUNT - index-1))
    }
    
    func  getMarginForTab( index :Int, scrollY :Int)->Int {
        var translation :Int = 0;
        
        if index == 0 {
            translation = 0
            
        }
        else {
            if scrollY < getCutOffTranslationForTab(index:index){
                translation = scrollY;
            }
            else{
                translation = getCutOffTranslationForTab(index:index);
            }
        }
        return translation+getOriginalTopMargin(index: index);
    }
    
    func  getCutOffTranslationForTab( index:Int) ->Int{
        if index == 0{
        return 0;
    }
    return (TOTAL_HEIGHT_OF_TAB ) * index;
    }
    
    
}

