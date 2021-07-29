//
//  AppDelegate.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 28/7/21.
//
// https://medium.com/@acwrightdesign/creating-a-macos-menu-bar-application-using-swiftui-54572a5d5f87
// https://www.anaghsharma.com/blog/macos-menu-bar-app-with-swiftui/
// https://medium.com/@theboi/macos-apps-without-storyboard-or-xib-menu-bar-in-swift-5-menubar-and-toolbar-6f6f2fa39ccb
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
            // button.action = nil
        }
        
        // Create the status item
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = self.statusBarItem.button {
            button.image = NSImage(named: "Icon")
        }
        let mainMenu = AppMenu();
        mainMenu.appDelegate = self
        statusBarItem.menu = mainMenu
    }
    
    
    @objc func setTimer1Min(_ sender: NSMenuItem?) {
        setTimer(duration: TimeInterval(1.0 * 60.0))
    }
    @objc func setTimer2Mins(_ sender: NSMenuItem?) {
        setTimer(duration: TimeInterval(2.0 * 60.0))
    }
    @objc func setTimer5Mins(_ sender: NSMenuItem?) {
        setTimer(duration: TimeInterval(5.0 * 60.0))
    }
    @objc func setTimer10Mins(_ sender: NSMenuItem?) {
        setTimer(duration: TimeInterval(10.0 * 60.0))
    }
    @objc func setTimer15Mins(_ sender: NSMenuItem?) {
        setTimer(duration: TimeInterval(15.0 * 60.0))
    }
    @objc func setTimer30Mins(_ sender: NSMenuItem?) {
        setTimer(duration: TimeInterval(30.0 * 60.0))
    }
    @objc func setTimer45Mins(_ sender: NSMenuItem?) {
        setTimer(duration: TimeInterval(45.0 * 60.0))
    }
    @objc func setTimer1Hour(_ sender: NSMenuItem?) {
        setTimer(duration: TimeInterval(1.0 * 60.0 * 60.0))
    }
    @objc func setTimer2Hours(_ sender: NSMenuItem?) {
        setTimer(duration: TimeInterval(2.0 * 60.0 * 60.0))
    }

    @objc func showPreferences(_ sender: NSMenuItem?) {
        print("showPreferences")
    }
    
    @objc func showAbout(_ sender: NSMenuItem?) {
    }

    private func setTimer(duration: TimeInterval) {
        print("duration: \(duration)")
    }
}

