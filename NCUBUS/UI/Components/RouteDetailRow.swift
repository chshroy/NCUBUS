//
//  RouteDetailRow.swift
//  NCUBUS
//
//  Created by royyaha on 21.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import SwiftUI

struct RouteDetailRow: View {
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: VerticalAlignment.center, spacing: 0) {
                Text(self.viewModel.stopName)
                .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .frame(width: geometry.size.width / 2, alignment: .trailing)
                
                ZStack {
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(self.viewModel.isfirst ? Color.white: Color.gray)
                            .frame(width: 20, height: geometry.size.height / 2)
                        
                        Rectangle()
                            .fill(self.viewModel.islast ? Color.white : Color.gray)
                         .frame(width: 20, height: geometry.size.height / 2)
                    }
                        
                    
                    Circle().fill(Color.white)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 5))
                        .frame(width: 40, height: 40)
                        
                }.frame(width: 40)
                .padding([.leading, .trailing], 20)
                
                Text("即將進站")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .frame(width: geometry.size.width / 4, alignment: .leading)
                    .padding(.trailing, 10)
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }.frame(height: 80)
            
    }
}

extension RouteDetailRow {
    class ViewModel: Identifiable {
        let id = UUID()
        let isfirst: Bool
        let islast: Bool
        private let stop: Stop
        init(stop: Stop, isfirst: Bool, islast: Bool) {
            self.stop = stop
            self.isfirst = isfirst
            self.islast = islast
        }
        var stopName: String {
            return stop.name.zh_tw
        }
        
        
        
    }
}

struct RouteDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailRow(viewModel: RouteDetailRow.ViewModel(stop: Stop.example1, isfirst: false, islast: false))
    }
}
