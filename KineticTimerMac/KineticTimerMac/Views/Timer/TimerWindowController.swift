//
//  TimerWindowController.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 2/8/21.
//

import Cocoa

class TimerWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been
        // loaded from its nib file.
        contentViewController = TimerController()
    }

}
