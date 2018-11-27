//
//  ViewController.swift
//  FirebaseCrashlyticsSampleForIOS
//
//  Created by Ryuichi Ishitsuka on 2018/11/22.
//  Copyright © 2018 Ryuichi Ishitsuka. All rights reserved.
//

import UIKit
import Crashlytics

class ViewController: UIViewController {
    
    var timer: Timer?
    var time: Int = 3
    
    @IBOutlet weak var timeLable: UILabel!
    
    @IBOutlet weak var crashButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpInsideCrashButton(_ sender: UIButton) {
        
        crashButton.isHidden = true
        timeLable.isHidden = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.time -= 1
            self.timeLable.text = String(self.time)
            if self.time == 0 {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                    Crashlytics.sharedInstance().crash()
                    
                })
            }
        }
    }
    
}

