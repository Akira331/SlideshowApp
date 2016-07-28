//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 正阿彌晃 on 2016/07/13.
//  Copyright © 2016年 Akira.Shoami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let photos = ["日本.jpg", "アメリカ.jpg", "ロシア.jpg"]
    //画像
    var countNumber:Int = 0
    var timerRunning = false
    var timer: NSTimer?
    
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    
    //イメージビュー
    
    @IBAction func backImage(sender: AnyObject) {
        
        //戻るボタン用
        countNumber -= 1
        if countNumber < 0 {
            countNumber = photos.count-1
        }
        
        imageButton .setImage(UIImage(named:photos[countNumber]), forState: .Normal)
        
    }
    
    @IBAction func nextImage(sender: AnyObject) {
        //進むボタン用
        countNumber += 1
        if countNumber >= photos.count {
            countNumber = 0
        }
        
        imageButton .setImage(UIImage(named:photos[countNumber]), forState: .Normal)
        
    }
    
    @IBAction func autoPlay(sender: AnyObject) {
        
        if timerRunning {
            
            //timerを破棄する.
            timer?.invalidate()
            timerRunning = false
            nextButton.enabled = true; // 押せるようになる。
            backButton.enabled = true;
        } else {
            
            //timerを生成する.
            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "timer:", userInfo: nil, repeats: true)
            timerRunning = true
        nextButton .enabled = false;// disableに設定。 これで押せなくなる。 imageButtonはUIButton
             backButton .enabled = false;
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initImageView()
        timer = NSTimer()
    }
    
    func initImageView(){
        // イメージビューにUIImageを設定
        
        imageButton .setImage(UIImage(named:photos[countNumber]), forState: .Normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timer (sender : NSTimer) {
        
        countNumber += 1
        if countNumber >= photos.count {
            countNumber = 0
        }
        
        imageButton .setImage(UIImage(named:photos[countNumber]), forState: .Normal)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destinationViewController as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているxに値を代入して渡す
        resultViewController.x = UIImage(named:photos[countNumber])!
        
}
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
}