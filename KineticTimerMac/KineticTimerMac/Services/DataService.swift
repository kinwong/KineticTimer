//
//  DataService.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 5/8/21.
//

import Foundation

protocol  DataService {
    func getTimers(completion: @escaping ([TimerModel]) -> Void)
}

final class DataServiceImpl: DataService {
    func getTimers(completion: @escaping ([TimerModel]) -> Void) {
        DispatchQueue.main.async {
            completion([
                TimerModel(id: 1, description: "Test Timer 1"),
                TimerModel(id: 2, description: "Test Timer 1"),
                TimerModel(id: 3, description: "Test Timer 1")
            ])
        }
    }
}
