//
//  AppDelegate.swift
//  patatan.js
//
//  Created by Ike Ku on 12/3/15.
//  Copyright © 2015 Ike Ku. All rights reserved.
//

import Cocoa
import WebKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var context: JSContext!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let path = NSBundle.mainBundle().pathForResource("main", ofType: "js")
        let source = try? String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        self.context = JSContext()
        self.context.setObject(JSApi(), forKeyedSubscript: "patatan")
        self.context.evaluateScript(source)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

