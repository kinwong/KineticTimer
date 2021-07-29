//
//  MainMenu.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 29/7/21.
//

import Foundation
import Cocoa

class AppMenu : NSMenu {
    var appDelegate: AppDelegate? = nil {
        willSet(newAppDelegate) {
            removeAllItems()
            if let appDelegate = newAppDelegate {
                populate(forDelegate: appDelegate)
            }
        }
    }
    
    override init(title: String) {
        super.init(title: title)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func populate(forDelegate delegate: AppDelegate) {
        let addTimer = NSMenuItem(title: "Add timer", action: nil, keyEquivalent: "")
        addTimer.submenu = NSMenu()
        addTimer.submenu?.items = [
            NSMenuItem(title: "1 minute", action: #selector(delegate.setTimer1Min), keyEquivalent: ""),
            NSMenuItem(title: "2 minutes", action: #selector(delegate.setTimer2Mins), keyEquivalent: ""),
            NSMenuItem(title: "5 minutes", action: #selector(delegate.setTimer5Mins), keyEquivalent: ""),
            NSMenuItem(title: "10 minutes", action: #selector(delegate.setTimer10Mins), keyEquivalent: ""),
            NSMenuItem(title: "15 minutes", action: #selector(delegate.setTimer15Mins), keyEquivalent: ""),
            NSMenuItem(title: "30 minutes", action: #selector(delegate.setTimer30Mins), keyEquivalent: ""),
            NSMenuItem(title: "45 minutes", action: #selector(delegate.setTimer45Mins), keyEquivalent: ""),
            NSMenuItem(title: "1 hour", action: #selector(delegate.setTimer1Hour), keyEquivalent: ""),
            NSMenuItem(title: "2 hours", action: #selector(delegate.setTimer2Hours), keyEquivalent: ""),
        ]
        items = [
            addTimer,
            NSMenuItem(title: "Preferences...", action: #selector(delegate.showPreferences), keyEquivalent: ","),
            NSMenuItem.separator(),
            NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        ]
    }
}
