//
//  DynamicView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-03-25.
//

import SwiftUI

struct DynamicView: View {
    
    @Binding var blurGridLayer: Bool
    
    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width > geometry.size.height {
                GridView(blurGridLayer: $blurGridLayer)
            } else {
                WeekdaysView(blurGridLayer: $blurGridLayer)
            }    }
    }
}
//#Preview {
//    DynamicView()
//}
