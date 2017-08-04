//
//  ViewController.swift
//  相冊
//
//  Created by Eric Yu-Wei Chen on 2017/8/2.
//  Copyright © 2017年 Eric Yu-Wei Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //我們所要做的事能夠更換照片，寫一個array，並將我們的照片key入
    let images = ["01.jpg","02.jpg","03.jpg","04.jpg","05.jpg"]
    
    var index:Int?
    
    @IBOutlet weak var galleryImageView: UIImageView!
    //製作一個button, 使照片可以藉由按鈕，更換照片到下一張
    @IBAction func changeImageAction(_ sender: UIButton) {
        
        //index! += 1
        //當index到底的時候可以回到起點0
        if index == images.count - 1{
            index = 0
        }else {
            index! += 1
        }
        
        print (index!)
        
        galleryImageView.image = UIImage(named: images[index!])
    }
   //製作另外一個可以讓照片回到上一張
    @IBAction func preImage(_ sender: UIButton) {
        if index == 0{
            index = images.count - 1
        }else {
            index! -= 1
        }
        
        print (index!)
        
        galleryImageView.image = UIImage(named: images[index!])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        index = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

