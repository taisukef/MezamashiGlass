//
//  ViewController.swift
//  MezamashiGlass
//
//  Created by taisuke on 2016/05/31.
//  public domain
//  see also http://fukuno.jig.jp/1406
//

import UIKit
import CoreMotion
import AudioToolbox

class ViewController: UIViewController {
    let motionManager = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 加速度センサーON
        motionManager.accelerometerUpdateInterval = 0.3 // 0.3秒間隔で取得
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue()) { data, error in
            guard data != nil else {
                print("err: \(error)")
                return
            }
            print("x: \(data!.acceleration.x) y: \(data!.acceleration.y) z: \(data!.acceleration.z)")
            
            // 加速度に応じて背景色を変える
            if (abs(data!.acceleration.x) > 0.2) {
                self.view.backgroundColor = UIColor.redColor()
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
            } else {
                self.view.backgroundColor = UIColor.whiteColor()
            }
        }
    }
    override func shouldAutorotate() -> Bool {
        return false // 自動回転OFF
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

