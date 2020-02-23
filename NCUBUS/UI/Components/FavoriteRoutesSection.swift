//
//  FavoriteRoutesSection.swift
//  NCUBUS
//
//  Created by royyaha on 10.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import SwiftUI

struct FavoriteRoutesSection: View {
    @ObservedObject private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

extension FavoriteRoutesSection {
    class ViewModel: ObservableObject {
        
    }
}
 

struct FavoriteRoutesSection_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRoutesSection(viewModel: FavoriteRoutesSection.ViewModel())
    }
}
