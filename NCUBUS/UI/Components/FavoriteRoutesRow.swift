//
//  FavoriteRouteRow.swift
//  NCUBUS
//
//  Created by royyaha on 08.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import SwiftUI

struct FavoriteRoutesRow: View {
    
    
    var body: some View {
        HStack {
            Text("Hello!")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
        
        
        
    }
}

struct FavoriteRouteRow_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRoutesRow()
        .previewLayout(.fixed(width: 375, height: 40))
    }
}
