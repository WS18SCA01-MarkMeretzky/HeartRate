//
//  HeartRateReceiver.swift
//  HeartRate
//
//  Created by Mark Meretzky on 12/31/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import Foundation;

class HeartRateReceiver {
    var delegate: HeartRateReceiverDelegate?;
    
    var currentHR: Int? {
        didSet {
            if let currentHR: Int = currentHR {
                print("The most recent heart rate reading is \(currentHR).");
                DispatchQueue.main.async {
                    //The following statement must be executed by the main thread,
                    //because only the main thread can write to the user interface.
                    self.delegate?.heartRateUpdated(to: currentHR);
                }
            } else {
                print("Looks like we can't pick up a heart rate.");
            }
        }
    }
    
    func startHeartRateMonitoringExample() {
        for _ in 0 ..< 10 {
            currentHR = Int.random(in: 60 ..< 75); //Random Int in the range 60 to 74 inclusive.
            Thread.sleep(forTimeInterval: 10);     //seconds
        }
    }
}
