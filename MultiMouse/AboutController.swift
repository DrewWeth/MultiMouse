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


class AboutController: NSViewController, NSApplicationDelegate {
    
    @IBOutlet weak var linkNSButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func linkClicked(sender: AnyObject) {
        println("clicked")
        NSWorkspace.sharedWorkspace().openURL(NSURL(string: "http://www.multimouse.me")!)
    }
    
}
