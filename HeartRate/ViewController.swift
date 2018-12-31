//
//  ViewController.swift
//  HeartRate
//
//  Created by Mark Meretzky on 12/31/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController: UIViewController, HeartRateReceiverDelegate {
    @IBOutlet weak var heartLabel: UILabel!;
    @IBOutlet weak var rateLabel: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        let dispatchQueue: DispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background);
        let heartRateReceiver: HeartRateReceiver = HeartRateReceiver();
        heartRateReceiver.delegate = self;
        
        //Do the 10-second pause in a different thread, so the main thread can
        //devote itself uninterruptedly keeping the user interface moving.
        dispatchQueue.async {
            heartRateReceiver.startHeartRateMonitoringExample();
        }
    }
    
    func heartRateUpdated(to bpm: Int) {
        heartLabel.layer.removeAllAnimations();
        heartLabel.transform = .identity;   //Go back to original size.
        rateLabel.text = "\(bpm) bpm";
        
        //Because of .autoreverse, each heartbeat is a pair of animations (grow and shrink).
        //That's why the 60 is divided by 2.
        let options: UIView.AnimationOptions = [.repeat, .autoreverse, .curveEaseInOut];
        
        UIView.animate(                               //Call a type method of class UIView.
            withDuration: 60.0 / (2.0 * Double(bpm)), //seconds
            delay: 0,
            options: options,
            animations: {
                self.heartLabel.transform = CGAffineTransform(scaleX: 1.125, y: 1.125);
            },
            completion: nil
        );
    }

}

