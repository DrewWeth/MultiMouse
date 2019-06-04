//
//  SettingsController.swift
//  MultiMouse
//
//  Created by AGW on 3/2/15.
//  Copyright (c) 2015 Andrew Wetherington. All rights reserved.
//

import Foundation
import Cocoa
import AppKit


class SettingsController: NSViewController, NSApplicationDelegate {
    
    @IBOutlet weak var setToggleButton: NSButton!
    @IBOutlet weak var currentToggleLabel: NSTextField!
    @IBOutlet weak var detailsLabel: NSTextField!

    var buttonActive:Bool = false

    
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.currentToggleLabel.stringValue = appDelegate.getToggleButton().description
        self.detailsLabel.stringValue = "Press button to set toggle button."
    }

    @IBAction func setToggleButton(sender: AnyObject) {
        self.detailsLabel.stringValue = "Press A Button"
        self.buttonActive = true

//        var event = NSEvent.addLocalMonitorForEvents(matching: NSEvent.EventTypeMask.keyUp) { (event) -> NSEvent? in
//            if ( self.buttonActive == true && event.type.rawValue != 5 && event.type.rawValue != 8 && event.type.rawValue != 9 && event.type.rawValue != 5 && event.type.rawValue != 14){
//
//                self.detailsLabel.stringValue = "Done"
//                self.currentToggleLabel.stringValue = String(event.type.rawValue)
//                print(event.type.rawValue)
//                self.appDelegate.toggleButton = event.type.rawValue
//                self.buttonActive = false
        
//                let delayTime = dispatch_time(DispatchTime.now(), Int64(NSEC_PER_SEC * 1))
//
//
//                dispatch_after(delayTime, DispatchQueue.main{
//                    self.detailsLabel.stringValue = "Press button to set toggle button."
//
//                    self.appDelegate.editGlobalListener()
//
//                }
//            }
//        }
//        event
    }
}
