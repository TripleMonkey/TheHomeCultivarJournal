//
//  ImageGridView.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 12/6/22.
//

import SwiftUI

struct ImageGridView: View {
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 70, maximum: 100), spacing: nil, alignment: nil)
    ]
    
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<50) { column in
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("PlaceholderColor"))
                    .frame(width: 80, height: 80)
                    .shadow(color: .gray, radius: 3, x: -3, y: 3)
                
            }
        }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}
