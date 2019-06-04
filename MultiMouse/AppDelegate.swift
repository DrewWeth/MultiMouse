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
    var event:Any?
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {

        self.setGlobalListener()

    }
    
    func setGlobalListener(){
        let mm = NSApplication.shared
        
        let window = mm.windows.last
        let screen = NSScreen.main?.frame
        let screenX = screen!.width / 2
        let screenY = screen!.height / 2
        
        window!.setFrameTopLeftPoint(CGPoint(x:screenX, y:screenY))
        
        print("toggleButton val \(self.toggleButton)")
        self.event = NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.keyUp, handler: { (event) in
        
            if let window = mm.windows.first {
                window.alphaValue = 1.0
                let frame = window.frame
                let fakeMousePnt = NSPoint(x: frame.origin.x, y: NSScreen.main!.frame.height - frame.origin.y - frame.height)
                var nativeMousePnt = CGPoint(x: event.locationInWindow.x, y: event.locationInWindow.y)
            
                
                // Swap fake mouse
                window.setFrameTopLeftPoint(nativeMousePnt)
                // Swap new mouse
                CGWarpMouseCursorPosition(fakeMousePnt)
                
                
                nativeMousePnt = NSEvent.mouseLocation
            }
        })
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
