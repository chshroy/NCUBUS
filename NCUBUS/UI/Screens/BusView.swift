//
//  ContentView.swift
//  NCUBUS
//
//  Created by royyaha on 08.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import SwiftUI

struct BusView: View {
    var viewModel: ViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Text("最愛路線")
                    .foregroundColor(Color.init("myOrange"))
                .padding()
                
                
                Text("全部路線")
                    .foregroundColor(Color.black)
                    .padding()
                
                viewModel.allRoutesSection
                
                
            }.background(Color.white)
        }.navigationBarHidden(true)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

extension BusView {
    class ViewModel {
        var allRoutesSection: some View {
            return BusViewBuilder.makeAllRoutesSection()
        }
    }

}

enum BusViewBuilder {
    static func makeAllRoutesSection() -> some View {
        let viewModel = AllRoutesSection.ViewModel(routesFetcher: RoutesFetcher())
        return AllRoutesSection(viewModel: viewModel)
    }
}


struct BusView_Previews: PreviewProvider {
    static var previews: some View {
        BusView(viewModel: BusView.ViewModel())
    }
}
