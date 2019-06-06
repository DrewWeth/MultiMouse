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

class CursorController: NSViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let cursorImage = NSImage(named: NSImage.Name(rawValue: "cursor.png"))!
        let imageView = NSImageView(frame: NSRect(origin: .zero, size: cursorImage.size))
        imageView.image = cursorImage
        
        self.view = imageView
    }
    

    
    override func viewDidAppear() {
        //view.window?.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(CGWindowLevelKey(rawValue: Int32(kCGFloatingWindowLevel))!)))
        view.window?.ignoresMouseEvents = false
        view.window?.isOpaque = false
        view.window?.backgroundColor = NSColor(calibratedWhite: 1.0, alpha: 0.0)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

