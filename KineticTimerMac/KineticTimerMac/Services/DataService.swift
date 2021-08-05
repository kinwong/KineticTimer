//
//  DataService.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 5/8/21.
//

import Foundation

protocol  DataService {
    func getTimers(completion: @escaping ([TimerDescription]) -> Void)
}
    
final class DataServiceImpl: DataService {
    func getTimers(completion: @escaping ([TimerDescription]) -> Void) {
        DispatchQueue.main.async {
            completion([
                TimerDescription(id: 1, description: "Test Timer 1"),
                TimerDescription(id: 2, description: "Test Timer 1"),
                TimerDescription(id: 3, description: "Test Timer 1"),
            ])
        }
    }
}
