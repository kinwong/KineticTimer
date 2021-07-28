//
//  AppDelegate.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 28/7/21.
//
// https://medium.com/@acwrightdesign/creating-a-macos-menu-bar-application-using-swiftui-54572a5d5f87
// https://www.anaghsharma.com/blog/macos-menu-bar-app-with-swiftui/

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        
        // Create the popover
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 500)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        self.popover = popover
        
        self.statusBarItem  = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
        if let button = self.statusBarItem.button {
            button.image = NSImage(named: "Icon")
            button.action = #selector(printQuote(_:))
        }
        
        // Create the status item
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = self.statusBarItem.button {
            button.image = NSImage(named: "Icon")
            //button.action = #selector(togglePopover(_:))
        }
        constructMenu()
        
    }
    
    func constructMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(printQuote(_:)), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Preferences...", action: #selector(showPreferences(_:)), keyEquivalent: ","))
        menu.addItem(NSMenuItem(title: "Exit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        self.statusBarItem.menu = menu
    }
    
    @objc func printQuote(_ sender: Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }
    
    @objc func showPreferences(_ sender: Any?) {
        print("showPreferences")
    }
}

