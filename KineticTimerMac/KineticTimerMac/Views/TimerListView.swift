//
//  TimerListView.swift
//  KineticTimerMac
//
//  Created by Kin Wong on 4/8/21.
//

import SwiftUI

struct TimerListView: View {
    @StateObject var model = ViewModel()

    init(viewModel: ViewModel = .init()) {
        // _model = StateObject(wrappedValue: viewModel)
    }

    var data: DataService? {
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
    final class ViewModel: ObservableObject {
        @Published var timers = [TimerModel]()
    }
}

struct TimerListView_Previews: PreviewProvider {
    static var previews: some View {
        let model = TimerListView.ViewModel()
        model.timers.append(TimerModel(id: 1, description: "Timer 1"))
        model.timers.append(TimerModel(id: 2, description: "Timer 2"))
        model.timers.append(TimerModel(id: 3, description: "Timer 3"))
        return TimerListView(viewModel: model)
    }
}
