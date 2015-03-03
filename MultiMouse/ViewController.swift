//
//  ViewController.swift
//  MultiMouse
//
//  Created by AGW on 2/28/15.
//  Copyright (c) 2015 Andrew Wetherington. All rights reserved.
//


import IOKit
import Cocoa
import AppKit


class ViewController: NSViewController {

    
    
    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.imageView.image = NSImage(named: "cursor.png")
        
        var rect = NSRect(x: 0.0, y: 0.0, width: 8.0, height: 15.0)
        var window = NSWindow(contentRect: rect, styleMask: 1, backing: NSBackingStoreType.Buffered, defer: false)
        window.awakeFromNib()

        var point = NSPoint(x: 0.0, y: 0.0)
        self.imageView.setFrameOrigin(point)
        
        self.imageView.setFrameSize(NSSize(width: 8.0, height: 15.0))
        // Do any additional setup after loading the view.

    }
    
    override func viewDidAppear() {
        println(view.window)
        
        view.window?.level = Int(CGWindowLevelForKey(Int32(kCGFloatingWindowLevelKey)))
        view.window?.ignoresMouseEvents = true
        view.window?.opaque = false
        view.window?.backgroundColor = NSColor(calibratedWhite: 1.0, alpha: 0.0)
        
        
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

