//
//  AchievementsDataSource.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 20/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

final class AchievementsDataSource {
    
    var achievements :[Achievement] = []

    init() {
        let WWDC = Achievement(title: "WWDC Student Scholarship Recipient", description: "After applying for 2 years for a WWDC Student Scholarship, in 2014 I was finally awarded with a free student ticket. I spent the best week of my life with people with my same passion from all over the world in San Francisco. I met people I only dreamt about and I learned a ton from the most skilled developers in the iOS community.", images: ["WWDC-1.jpg", "WWDC-2.jpg", "WWDC-3.jpg", "WWDC-4.jpg", "WWDC-5.jpg", "WWDC-6.jpg", "WWDC-7.jpg"])
        let NSConf = Achievement(title: "NSConf 7", description: "This year I wanted to meet as many new developers as possible. I love exchanging opinions and meeting new people from all around the world. NSConf was offering to selected students a free ticket. I was lucky enough to be one of them. I flew to London for a few days and learned a lot! It was a really great experience.", images: ["NSConf-1.jpg", "NSConf-2.jpg", "NSConf-3.jpg"])
        let Pebble = Achievement(title: "Pebble Developer Retreat Invitation", description: "During October 2014, I was invited at the annual Pebble Developer Retreat in Mountain View. At this conference with many great developers, I was able to improve my Pebble applications used by more than 30'000 people. It was an awesome week!", images: ["Pebble-1.jpg", "Pebble-2.jpg"])
        let WatchKitZurich = Achievement(title: "Organized WatchKit Zurich", description: "I've been always interested in wearable devices and with the latest announcement about WatchKit and the Apple Watch, I wanted to help other people experience the same excitement about this new possibilities. For this reason, Dylan Marriott and I organized an hackathon to get more people interested in this opportunity.", images: ["WatchKitZurich-1.jpg", "WatchKitZurich-2.jpg", "WatchKitZurich-3.jpg"])
        
        achievements.append(WWDC)
        achievements.append(NSConf)
        achievements.append(Pebble)
        achievements.append(WatchKitZurich)
    }
   
}
