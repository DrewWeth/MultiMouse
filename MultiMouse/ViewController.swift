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
        
        
        self.imageView.image = NSImage(contentsOfFile: "cursor.png")
        
        let rect = NSRect(x: 0, y: 0, width: 8.0, height: 15.0)
        let window = NSWindow(contentRect: rect, styleMask: NSWindow.StyleMask(rawValue: 1), backing: NSWindow.BackingStoreType.buffered, defer: false)
        window.awakeFromNib()

        let point = NSPoint(x: 0.0, y: 0.0)
        self.imageView.setFrameOrigin(point)
        
        self.imageView.setFrameSize(NSSize(width: 8.0, height: 15.0))
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        print(view.window)
        
        view.window?.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(CGWindowLevelKey(rawValue: Int32(kCGFloatingWindowLevel))!)))
        view.window?.ignoresMouseEvents = true
        view.window?.isOpaque = false
        view.window?.backgroundColor = NSColor(calibratedWhite: 1.0, alpha: 0.0)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

