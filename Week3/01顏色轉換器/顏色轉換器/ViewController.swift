//
//  ViewController.swift
//  顏色轉換器
//
//  Created by Eric Yu-Wei Chen on 2017/7/30.
//  Copyright © 2017年 Eric Yu-Wei Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var colors = ["red","blue","yellow","green"]
    var index:Int?//程式加載時初始化
    @IBOutlet weak var changeColorBtn: UIButton!
    @IBAction func changeColorAction(_ sender: Any) {
        
        if index == colors.count - 1{
           index = 0
        } else {
            index! += 1
        }
        //print(colors[index!])
        
        //view.backgroundColor = UIColor.blue
        
        //changeColor(string: colors[index!])
        randomColor()
        
        changeColorBtn.setTitleColor(UIColor.white, for: .normal)
    }
    
    func changeColor(string:String){
        if string == "red"{
            view.backgroundColor = UIColor.red
        }else if string == "blue"{
            view.backgroundColor = UIColor.blue
        }else if string == "yellow"{
            view.backgroundColor = UIColor.yellow
        }else if string == "green"{
            view.backgroundColor = UIColor.green
        }
    }
    
    func randomColor(){
        let randomRed = CGFloat(arc4random_uniform(256))/255
        let randomBlue = CGFloat(arc4random_uniform(256))/255
        let randomGreen = CGFloat(arc4random_uniform(256))/255
    
        view.backgroundColor = UIColor.init(red:randomRed, green:randomGreen, blue:randomBlue, alpha:0.8)//alpha:表示透明度
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        index = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

