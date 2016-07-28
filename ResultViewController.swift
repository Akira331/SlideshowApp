//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 正阿彌晃 on 2016/07/18.
//  Copyright © 2016年 Akira.Shoami. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    // 2画面目のLabelを、StoryboardでこのViewControllerにIBOutletとして接続しておく
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    var x = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // 上記では、x を 0 と宣言していたが、
        // 1画面目のViewControllerから遷移するときにprepareForSegueで
        // xの値を新たに代入されたので両方共 1 が入っている
    
        imageView.image = x
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


