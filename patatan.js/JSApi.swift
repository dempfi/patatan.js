//
//  JSApi.swift
//  patatan.js
//
//  Created by Ike Ku on 12/3/15.
//  Copyright © 2015 Ike Ku. All rights reserved.
//

import Cocoa
import WebKit

@objc protocol Exports : JSExport {
    func log(s:String)
    func createWindow()
}


@objc class JSApi: NSObject, Exports {
    
    var windows: [NSWindow] = []
    
    func log(s:String) {
        print(s)
    }
    
    override init() {
        super.init()
        self.createWindow()
    }
    
    func createWindow() {
        let window = NSWindow(contentRect: NSMakeRect(100, 100, 600, 400),
            styleMask: NSTitledWindowMask|NSResizableWindowMask|NSMiniaturizableWindowMask|NSClosableWindowMask,
            backing: NSBackingStoreType.Buffered, `defer`: true)
        let webView = self.createWebView(window)
        window.contentView?.addSubview(webView)
        window.title = "New Window"
        window.center()
        window.makeKeyAndOrderFront(nil)
        self.windows.append(window)
    }
    
    func createWebView(window: NSWindow) -> WebView {
        let view = WebView(frame: window.contentView!.bounds)
        let url = NSBundle.mainBundle()
            .URLForResource("main", withExtension: "html")
        view.mainFrame.loadRequest(NSURLRequest(URL: url!))
        //        let jsWindow = view.windowScriptObject
        //        jsWindow.setValue(JsHost(), forKey: "host")
        return view
    }
    
}