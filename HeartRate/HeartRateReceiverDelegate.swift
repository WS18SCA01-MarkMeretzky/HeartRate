//
//  HeartRateReceiverDelegate.swift
//  HeartRate
//
//  Created by Mark Meretzky on 12/31/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import Foundation;

protocol HeartRateReceiverDelegate {
    func heartRateUpdated(to bpm: Int);   //beats per minute
}
