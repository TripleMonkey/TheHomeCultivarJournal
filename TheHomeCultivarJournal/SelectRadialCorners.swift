//
//  SelectRadialCorners.swift
//  THCJournal
//
//  Created by Nigel Krajewski on 2/8/23.
//

import SwiftUI

struct SelectRadialCorners: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct SelectCornerShape: Shape {
        
        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners
        
        func path(in shape: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: shape, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
    
    func body(content: Content) -> some View {
        content
            .clipShape(SelectCornerShape(radius: radius, corners: corners))
    }
}

extension View {
    func selectRadialCorners(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: SelectRadialCorners(radius: radius, corners: corners))
    }
}
