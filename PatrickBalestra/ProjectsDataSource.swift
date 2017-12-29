//
//  ProjectsDataSource.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 19/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

final class ProjectsDataSource {
    
    var projects :[Project] = []
    
    init() {
        let notesForWatch = Project(
            title: "Notes for Watch",
            subtitle: "Beautiful notes for your Apple Watch.",
            description: "Since the moment the Apple Watch was announced, I was super excited by the endless possibilities that this new device has opened. I was suprised to discover that there is no built in app to keep notes on the watch. I took this as a great opportunity to think about it and create the best experience possible. I released Notes for Watch on the first day when the Apple Watch was available. It allows users to write, save, dictate and even customize the font size of every single note and keep them on their wrist.",
            iconName: "NotesWatch.png",
            screenshotNames: ["NotesForWatch-1", "NotesForWatch-2", "NotesForWatch-3"],
            websiteLink: URL(string: "http://www.noteswat.ch")!,
            iTunesID: "973679652",
            date: "April 2015",
            skills: ["Core Data", "Swift", "WatchKit"],
            appColor: UIColor(red:0.943, green:0.926, blue:0, alpha:1))
        
        let weightTracker = Project(
            title: "Weight Tracker",
            subtitle: "The simplest way to track your weight.",
            description: "I've been interested in HealthKit since its announcement during last year WWDC. A few months ago I started tracking my weight every morning and I found it annoying to always have to remember my previous weight. So I had the idea to build an app to keep track of the user weight with many features in it. It integrates perfectly with the Health app on iOS 8.",
            iconName: "WeightTracker.png",
            screenshotNames: ["WeightTracker-1", "WeightTracker-2", "WeightTracker-3"],
            websiteLink: URL(string: "http://www.patrickbalestra.com/WeightTracker")!,
            iTunesID: "935650952",
            date: "Februrary 2015",
            skills: ["HealthKit", "Graph Drawing"],
            appColor: UIColor(red:0.466, green:0.816, blue:0.834, alpha:1))
        
        let minuto = Project(
            title: "Minuto.ch",
            subtitle: "Order your meal with your iPhone.",
            description: "I developed the Minuto app for 2 friends who are trying to build their own business. The app makes really easy to order food online which is delivered directly to the client door. I coded and designed the iOS app. I have also built the backend side which sends the order receipts to the shop and to the client and manages the whole order system. It was a really big work!",
            iconName: "Minuto.png",
            screenshotNames: ["Minuto-1", "Minuto-2", "Minuto-3"],
            websiteLink: URL(string: "http://www.minuto.ch")!,
            iTunesID: "961415214",
            date: "February 2015",
            skills: ["Core Location", "Parse Framework", "Javascript"],
            appColor: UIColor(red:0.873, green:0.124, blue:0.099, alpha:1))
        
        let reviews = Project(
            title: "Reviews for iOS",
            subtitle: "An app to allow developers to track app reviews.",
            description: "I developed this app with my friend Max from Germany. We started collaborating a few months ago when we met on Twitter. The app allows developers to track app reviews directly from an iPhone or iPad. For every developer it's very important to always be up to date with the user's feedback and reviews. This is why we wanted to make the process simpler, faster and easier.",
            iconName: "ReviewsForiOS.png",
            screenshotNames: ["Reviews-1", "Reviews-2", "Reviews-3"],
            websiteLink: URL(string: "http://www.reviewsapp.io")!,
            iTunesID: "909620669",
            date: "August 2014",
            skills: ["UI Design", "UI Animations", "Web Design"],
            appColor: UIColor(red:0.995, green:0.582, blue:0.201, alpha:1))
        
        let notesForPebble = Project(
            title: "Notes for Pebble",
            subtitle: "All your notes, on your wrist.",
            description: "Notes for Pebble was my first app developed for this smartwatch. I was interested in seeing how an iPhone and a smartwatch can work together to simplify our life. So I created this app that allows users to write and store notes on the iPhone and then have them automatically sent and saved to the smartwatch. More than 100000 notes were created so far! I was really impressed by the response of my users and I learned a lot with this experience.",
            iconName: "NotesForPebble.png",
            screenshotNames: ["NotesForPebble-1", "NotesForPebble-2", "NotesForPebble-3"],
            websiteLink: URL(string: "http://www.patrickbalestra.com/PebbleNotes")!,
            iTunesID: "841925707",
            date: "March 2014",
            skills: ["Core Data", "Pebble SDK", "C"],
            appColor: UIColor(red:1, green:0.195, blue:0.351, alpha:1))
        
        let contactsForPebble = Project(
            title: "Contacts for Pebble",
            subtitle: "Always keep your contacts on your Pebble.",
            description: "After seeing the success of Notes for Pebble I decided to make a similar app but for contacts. This idea came from one of my users who told me that the app would be very useful to keep important contacts on the smartwatch. I later implemented a feature which allows to start a call directly from the watch.",
            iconName: "ContactsForPebble.png",
            screenshotNames: ["ContactsForPebble-1", "ContactsForPebble-2", "ContactsForPebble-3"],
            websiteLink: URL(string: "http://www.patrickbalestra.com/PebbleContacts")!,
            iTunesID: "889603734",
            date: "July 2014",
            skills: ["Address Book", "Pebble SDK", "C"],
            appColor: UIColor(red:0.112, green:0.681, blue:0.966, alpha:1))
        
        let emergency = Project(
            title: "Emergency Phone Numbers",
            subtitle: "All the emergency phone numbers you need in your pocket.",
            description:"It's important to know the emergency phone numbers at any given moment but this may not be the case if you're a frequent traveller or you're visiting a foreign country. If you need help, just slide your finger to call and the phone will automatically dial for help.\nYou can also double tap the screen and the app will automatically find the emergency phone numbers wherever your are for you.\nThere is a map that allows you to see your position and have your exact address and your coordinates (latitude and longitude).",
            iconName: "Emergency.png",
            screenshotNames: ["Emergency-1", "Emergency-2", "Emergency-3"],
            websiteLink: URL(string: "http://www.patrickbalestra.com/emergency/index.html")!,
            iTunesID: "574170034",
            date: "February 2013",
            skills: ["Core Location", "iOS 8 Extension", "REST API"],
            appColor: UIColor(red:0.993, green:0.43, blue:0.298, alpha:1))
        
        projects.append(notesForWatch)
        projects.append(weightTracker)
        projects.append(minuto)
        projects.append(reviews)
        projects.append(notesForPebble)
        projects.append(contactsForPebble)
        projects.append(emergency)
    }
   
}
