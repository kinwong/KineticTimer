//
//  DataService.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 5/8/21.
//

import Foundation

protocol  DataService {
    func getTimers(completion: @escaping ([Timer]) -> Void)
}
    
final class DataServiceImpl: DataService {
    func getTimers(completion: @escaping ([Timer]) -> Void) {
        DispatchQueue.main.async {
            completion([
                Timer(id: 1, description: "Test Timer 1"),
                Timer(id: 2, description: "Test Timer 1"),
                Timer(id: 3, description: "Test Timer 1"),
            ])
        }
    }
}
