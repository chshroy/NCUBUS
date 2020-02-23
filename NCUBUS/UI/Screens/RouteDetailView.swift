//
//  RouteDetailView.swift
//  NCUBUS
//
//  Created by royyaha on 10.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import SwiftUI
import Combine

struct RouteDetailView: View {
    private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(viewModel.dataSource) { data in
                        RouteDetailRow(viewModel: data)
                    }
                    .listRowInsets(EdgeInsets())
                }.padding(.top, 30)
                .padding(.bottom, 100)
                
            }
            
        }
    }
}

extension RouteDetailView {
    class ViewModel {
        @Published var dataSource: [RouteDetailRow.ViewModel] = []
        
        private let routesFetcher: RoutesFetchable
        private var disposables = Set<AnyCancellable>()
        private var routeUid: String
        init(routeUid: String, routesFetcher: RoutesFetchable) {
            self.routesFetcher = routesFetcher
            self.routeUid = routeUid
            self.refresh()
        }
        
        func refresh() {
            routesFetcher.allRoutes()
                .map { response in
                    response.routes
                        .first(where:  { route in
                        route.direction == 0 && route.uid == self.routeUid
                    })
                }
                 .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                  guard let self = self else { return }
                  switch value {
                  case .failure:
                    self.dataSource = []
                  case .finished:
                    break
                  }
                },receiveValue: { [weak self] data in
                guard let self = self else { return }
                    guard let stops = data?.stops  else {
                        print("cant convert data.stops to stops")
                        return
                    }
                    self.dataSource.removeAll()
                    for (index, stop) in stops.enumerated() {
                        self.dataSource.append(RouteDetailRow.ViewModel(stop: stop, isfirst: index == 0, islast: index == stops.count - 1))
                    }
            })
            .store(in: &disposables)
        }
    }
}

struct RouteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailView(viewModel: RouteDetailView.ViewModel(routeUid: "haha", routesFetcher: RoutesFetcher()))
    }
}
