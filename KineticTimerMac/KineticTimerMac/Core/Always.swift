//
//  Always.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 10/8/21.
//
// https://thoughtbot.com/blog/lets-build-a-custom-publisher-in-combine

import Combine

/// `Always` is a publisher that continuously emits the
/// same output as long as there is demand.
public struct Always<Output>: Publisher {
    public typealias Failure = Never
    
    public let output: Output
    
    public init(_ output: Output) {
        self.output = output
    }
    
    public func receive<S: Subscriber>(subscriber: S) where S.Input == Output, S.Failure == Failure {
        let subscription = Subscription(output: output, subscriber: subscriber)
        subscriber.receive(subscription: subscription)
    }
}

private extension Always {
    final class Subscription<S: Subscriber> where S.Input == Output, S.Failure == Failure {
        private let output: Output
        private var subscriber: S?
        
        init(output: Output, subscriber: S) {
            self.output = output
            self.subscriber = subscriber
        }
    }
}

extension Always.Subscription: Subscription {
    func cancel() {
        subscriber = nil
    }
    
    func request(_ demand: Subscribers.Demand) {
        var demand = demand
        while let subscriber = subscriber, demand > 0 {
          demand -= 1
          demand += subscriber.receive(output)
        }
    }
}
