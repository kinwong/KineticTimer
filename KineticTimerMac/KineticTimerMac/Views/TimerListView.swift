//
//  TimerListView.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 4/8/21.
//

import SwiftUI

struct TimerListView: View {
    @StateObject var model = Model()
    
    init(viewModel: Model = .init()) {
        _model = StateObject(wrappedValue: viewModel)
    }
    
    var data: DataService? = nil {
        didSet {
            refresh()
        }
    }
    
    var body: some View {
        List(model.timers) { timer in
            Text(timer.description)
        }
        .onAppear(perform: {
            refresh()
        })
    }
    
    func refresh() {
    }
}

extension TimerListView {
    final class Model: ObservableObject {
        @Published var timers = [TimerDescription]()
    }
}

struct TimerListView_Previews: PreviewProvider {
    static var previews: some View {
        let model = TimerListView.Model()
        model.timers.append(TimerDescription(id: 1, description: "Timer 1"))
        model.timers.append(TimerDescription(id: 2, description: "Timer 2"))
        model.timers.append(TimerDescription(id: 3, description: "Timer 3"))
        return TimerListView(viewModel: model)
    }
}

