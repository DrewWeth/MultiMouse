//
//  AppDelegate.swift
//  MultiMouse
//
//  Created by AGW on 2/28/15.
//  Copyright (c) 2015 Andrew Wetherington. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var cursorWindowController: NSWindowController?
    var toggleButton:UInt = 25
    var event:Any?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("App is launched...")
        
        self.setGlobalListener()
    }

    func setGlobalListener(){
        let cursorController = CursorController()
        let cursorWindow = NSWindow(contentViewController: cursorController)
        cursorWindowController = NSWindowController(window: cursorWindow)
    
        if let window = cursorWindowController!.window {
            print ("we have a window!")
            
            let frame = NSScreen.main!.frame
            let commonPoint = NSPoint(x: frame.maxX / 4, y: frame.maxY / 4)
            
            window.styleMask = .borderless
            window.level = .floating
            window.setContentSize(NSSize(width: 8, height: 15))
            window.setFrameTopLeftPoint(commonPoint)
            cursorWindowController?.showWindow(nil)
            
        } else {
            print ("no window")
        }
        
        self.event = NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.keyDown, handler: { (event) in
            if(event.keyCode == KeyCodes.z && event.modifierFlags.contains(NSEvent.ModifierFlags.control)){
                print("Boom")
                if let windowController = self.cursorWindowController, let window = windowController.window {

                    let mouseLocation = NSPoint(x: event.locationInWindow.x, y: event.locationInWindow.y)
                    let currentWindowLocation = NSPoint(x: window.frame.origin.x, y: window.frame.origin.y)
                    
                    let newWindowLocation = NSPoint(x: mouseLocation.x, y: mouseLocation.y - window.frame.height)
                    window.setFrameOrigin(newWindowLocation)
                    
                    let newMouseLocation = NSPoint(x: currentWindowLocation.x, y: NSScreen.main!.frame.height - currentWindowLocation.y - window.frame.height)
                    
                    CGWarpMouseCursorPosition(newMouseLocation)
                    window.makeKey()
                }
            }
        })
    }
    
    func editGlobalListener(){
        NSEvent.removeMonitor(self.event!)
        self.setGlobalListener()
    }

    func getToggleButton()-> UInt{
        return self.toggleButton
    }
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    
}
