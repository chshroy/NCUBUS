//
//  AllRoutesRow.swift
//  NCUBUS
//
//  Created by royyaha on 09.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import SwiftUI

struct AllRoutesRow: View {
    private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            HStack(alignment: VerticalAlignment.center, spacing: 0) {
                Rectangle()
                .fill(Color.gray)
                .frame(width: 18, height: 84)
                .padding(.trailing, 15)
                
                GeometryReader { geometry in
                    HStack(alignment: VerticalAlignment.center) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text(self.viewModel.routeName)
                                    .font(.system(size: 18))
                                    .fontWeight(.black)
                                    .foregroundColor(Color.black)
                            }
                            HStack(spacing: 0) {
                                Text(self.viewModel.startStop)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: geometry.size.width / 3, alignment: .leading)
                                Image("route")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * (1 / 5))
                                    .padding([.leading, .trailing], 5)
                                Text(self.viewModel.endStop)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: geometry.size.width / 3, alignment: .leading)
                            }
                        }
                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                }
                Image(systemName: "chevron.right")
                    .padding(.trailing, 15)
                    .foregroundColor(Color.gray)
            }
        }.frame(height: 95)
    }
}

extension AllRoutesRow {
    class ViewModel: Identifiable {
        let id = UUID()
        private let route: Route
        
        init(route: Route) {
            self.route = route
        }
        
        var startStop: String {
            return route.stops[0].name["zh_tw"] ?? "??"
        }
        
        var endStop: String {
            return route.stops[route.stops.count - 1].name["zh_tw"] ?? "??"
        }
        
        var routeName: String {
            return route.name["zh_tw"] ?? "??"
        }
    }
}

struct AllRoutesRow_Previews: PreviewProvider {
    static var previews: some View {
        AllRoutesRow(viewModel: AllRoutesRow.ViewModel(route: Route.example))
    }
}
