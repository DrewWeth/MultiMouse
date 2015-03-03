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

    var toggleButton:UInt = 25
    var event:AnyObject!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.setGlobalListener()
        
    }
    
    func setGlobalListener(){
        
        var mm = NSApplication.sharedApplication()
        
        var window = mm.windows.last
        window!.setFrameTopLeftPoint(CGPoint(x:0, y:0))
        
        println("toggleButton val \(self.toggleButton)")
        self.event = NSEvent.addGlobalMonitorForEventsMatchingMask(NSEventMaskFromType(NSEventType(rawValue: self.toggleButton)!)){
            (handler:NSEvent!) in
            println(handler.type.rawValue)
            //              qvar window = mm.mainWindow
            var window = mm.windows.first as NSWindow
            
            window.alphaValue = 1.0
            
            var frame = window.frame
            //            println("Main \(NSScreen.mainScreen()!.frame.height)")
            var fakeMousePnt = NSPoint(x: frame.origin.x, y: NSScreen.mainScreen()!.frame.height - frame.origin.y - frame.height)
            //            println("Fake was at \(fakeMousePnt)")
            var nativeMousePnt = CGPoint(x: handler.locationInWindow.x, y: handler.locationInWindow.y)
            //            println("Native \(nativeMousePnt)")
            
            
            // Swap fake mouse
            window.setFrameTopLeftPoint(nativeMousePnt)
            // Swap new mouse
            CGWarpMouseCursorPosition(fakeMousePnt)
            
            
            nativeMousePnt = NSEvent.mouseLocation()
            println("New Native \(nativeMousePnt)")
            
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC * 3))
            dispatch_after(delayTime, dispatch_get_main_queue()){
                
                window.alphaValue = 0.5
            }
        }
    }
    
    func editGlobalListener(){
        NSEvent.removeMonitor(self.event)
        self.setGlobalListener()
    }

    func getToggleButton()-> UInt{
        return self.toggleButton
    }
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

