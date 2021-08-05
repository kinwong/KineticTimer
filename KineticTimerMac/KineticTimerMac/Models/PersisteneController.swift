//
//  PersisteneController.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 5/8/21.
// https://www.youtube.com/watch?v=_GJlFk-Hhz8

import Foundation
import CoreData

struct PersisteneController {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Stash")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        context.delete(object)
        save(completion: completion)
    }
}

