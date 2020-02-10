//
//  AllRoutesSection.swift
//  NCUBUS
//
//  Created by royyaha on 09.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import SwiftUI

struct AllRoutesSection: View {
    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.viewModel.refresh()
        print("pepepe")
    }
    var body: some View {
        ScrollView {
            ForEach(self.viewModel.dataSource) { data in
                NavigationLink(destination: Text("haha")) {
                    AllRoutesRow(viewModel: data)
                    .listRowInsets(EdgeInsets())
                }.buttonStyle(PlainButtonStyle())
                
            }
        }
    }
}

extension AllRoutesSection {
    class ViewModel: ObservableObject {
        @Published var dataSource: [AllRoutesRow.ViewModel] = []
        private let routesFetcher: RoutesFetcher
        
        init(
            routesFetcher: RoutesFetcher
        ) {
            self.routesFetcher = routesFetcher
        }
        
        func refresh() {
            routesFetcher.allRoutes()
                .map { response in
                    response.routes.map() { route in
                        AllRoutesRow.ViewModel.init(route: route)
                    }
                }
            .sink(receiveCompletion: {_ in
            },receiveValue: { [weak self] forecast in
                guard let self = self else { return }
                self.dataSource = forecast
            })
        }
    }
}

struct AllRoutesSection_Previews: PreviewProvider {
    
    static var previews: some View {
        AllRoutesSection(viewModel: AllRoutesSection.ViewModel(routesFetcher: RoutesFetcher()))
    }
}
