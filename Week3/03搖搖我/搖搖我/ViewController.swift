//
//  ViewController.swift
//  搖搖我
//
//  Created by Eric Yu-Wei Chen on 2017/8/2.
//  Copyright © 2017年 Eric Yu-Wei Chen. All rights reserved.
//

import UIKit
import AVFoundation//匯入音頻的基本framework，用來定義音頻影片的播放功能

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()

    @IBAction func sliderMoved(_ sender: Any) {
        
        player.volume = (sender as AnyObject).value
    }
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 我們在此將圖片修剪成圓角
        // 並將多餘的部分才切掉
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        playSound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //1. 利用override來擴充我們的函式
    //2. motionEnded這個函式可以讓我們的程序知道用戶已經完成搖晃動作
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        //我們當前的事件是UIEventSubtype中的一個子類型-->motionShake
        if event?.subtype == UIEventSubtype.motionShake {
            rotateImage()
            player.play()
        }
    }
    
    func playSound() {
        let filePath = Bundle.main.path(forResource: "Cow voice", ofType: "wav")
        
        do {
            try player = AVAudioPlayer(contentsOf:URL(fileURLWithPath: filePath!))
        
        } catch {
            
            print("error message with mp3 file")
        }
        
    }
    
    
    //旋轉圖片的函式
    func rotateImage(){
        
        var rotation:CGAffineTransform?
        rotation = CGAffineTransform(rotationAngle: -2)
        
        UIView.animate(withDuration: 0.09, animations: {
            self.imageView.transform = rotation! //是view的一個部分
        
        }) { (true) in
            self.rotateBack()
        }
    }
    
    //圖片旋轉回來的函式
        func rotateBack(){
            var rotation:CGAffineTransform?
            UIView.animate(withDuration: 0.09, delay: 0.2, options: [], animations: {
                rotation = CGAffineTransform(rotationAngle: 0)
                self.imageView.transform = rotation!
            
            }, completion:nil)
        }
        
    }
    


