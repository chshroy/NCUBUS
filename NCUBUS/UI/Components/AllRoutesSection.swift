//
//  AllRoutesSection.swift
//  NCUBUS
//
//  Created by royyaha on 09.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import SwiftUI
import Combine

struct AllRoutesSection: View {
    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            ForEach(self.viewModel.dataSource) { data in
                AllRoutesRow(viewModel: data)
                .listRowInsets(EdgeInsets())
            }
        }
//    .onAppear(perform: viewModel.refresh)
    }
}

extension AllRoutesSection {
    class ViewModel: ObservableObject {
        @Published var dataSource: [AllRoutesRow.ViewModel] = [AllRoutesRow.ViewModel.init(route: Route.example)]
        
        private let routesFetcher: RoutesFetchable
        private var disposables = Set<AnyCancellable>()
        
        init(routesFetcher: RoutesFetchable) {
            self.routesFetcher = routesFetcher
            self.refresh()
        }
        
        func refresh() {
            routesFetcher.allRoutes()
                .map { response in
                    response.routes
                    .filter { route in
                        route.direction == 0
                    }
                    .map() { route in
                        AllRoutesRow.ViewModel(route: route)
                    }
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
                    self.dataSource = data
            })
            .store(in: &disposables)
        }
        
    }
}

struct AllRoutesSection_Previews: PreviewProvider {
    
    static var previews: some View {
        AllRoutesSection(viewModel: AllRoutesSection.ViewModel(routesFetcher: RoutesFetcher()))
    }
}
