//
//  StatusBarController.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 28/7/21.
//

import AppKit

class StatusBarController {
    private let statusBar: NSStatusBar
    private let statusItem: NSStatusItem
    
    init() {
        statusBar = NSStatusBar.init()
        // Creating a status bar item having a fixed length
        statusItem = statusBar.statusItem(withLength: 28.0)
        
        if let statusBarButton = statusItem.button {
            statusBarButton.image = #imageLiteral(resourceName: "StatusBarIcon")
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            statusBarButton.image?.isTemplate = true
        }
    }
}
