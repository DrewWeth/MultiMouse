//
//  WindowController.swift
//  MultiMouse
//
//  Created by AGW on 2/28/15.
//  Copyright (c) 2015 Andrew Wetherington. All rights reserved.
//

import Foundation
import Cocoa
import AppKit

class MyWindowController: NSWindowController {
    var mainW:NSWindow = NSWindow()
    
    override init() {
        super.init()
    }
    
    override init(window: NSWindow!) {
        super.init(window: window)
        //Initialization code here.
        
        
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder);
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    //method called to display the modal window
    func beginSheet(mainWindow: NSWindow){
        self.mainW = mainWindow
        NSApp.beginSheet(self.window!, modalForWindow: mainWindow, modalDelegate: self, didEndSelector:nil, contextInfo: nil)
        
    }
    
    //method called, when "Close" - Button clicked
    @IBAction func btnClicked(sender: AnyObject) {
        self.endSheet();
    }
    
    //method called to slide out the modal window
    func endSheet(){
        NSApp.endSheet(self.window!)
        self.window!.orderOut(mainW)
    }
    
    
    
    
    
}