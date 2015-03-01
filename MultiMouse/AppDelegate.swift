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


    
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        var mm = NSApplication.sharedApplication()
        
        var window = mm.windows.last
        window!.setFrameTopLeftPoint(CGPoint(x:0, y:0))
        
        
        var event = NSEvent.addGlobalMonitorForEventsMatchingMask(NSEventMask.OtherMouseUpMask){
            (handler:NSEvent!) in
            
//            var window = mm.mainWindow
            var window = mm.windows.last
            var frame = window!.frame
            println("Main \(NSScreen.mainScreen()!.frame.height)")
            var fakeMousePnt = NSPoint(x: frame.origin.x, y: NSScreen.mainScreen()!.frame.height - frame.origin.y - frame.height)
            println("Fake was at \(fakeMousePnt)")
            var nativeMousePnt = CGPoint(x: handler.locationInWindow.x, y: handler.locationInWindow.y)
//            println("Native \(nativeMousePnt)")
            
            
            // Swap fake mouse
            window!.setFrameTopLeftPoint(nativeMousePnt)
            // Swap new mouse
            CGWarpMouseCursorPosition(fakeMousePnt)
            
            
             window = mm.windows.first
            frame = window!.frame
             fakeMousePnt = NSPoint(x:frame.origin.x, y:frame.origin.y + frame.height )
            
//            println("New Fake \(fakeMousePnt)")

            nativeMousePnt = NSEvent.mouseLocation()
            println("New Native \(nativeMousePnt)")
            
//            let path = NSBundle.mainBundle().pathForResource("script", ofType: "scpt")
//            println(path)
//            var rawCommand = "ruby ~/multimouse/test.rb"
//            println(system(rawCommand))
//            
//            var rawCommand = "osascript -e 'tell application \"MultiMouse\" to activate' -e 'get position of front window'"
//
//            var script = NSAppleScript(source: "-e 'tell application \"MultiMouse\" to activate' -e 'tell application \"System Events\" to tell process \"MultiMouse\"' -e 'get position of front window' -e 'end tell'")
//            var error = AutoreleasingUnsafeMutablePointer<NSDictionary?>()
//            script?.executeAndReturnError( error)
//            println(error)
        }
    }

    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

