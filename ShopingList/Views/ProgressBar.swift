//
//  ProgressBar.swift
//  DreamTeam
//
//  Created by Marta Kalichynska on 07.08.2024.
//

import SwiftUI

struct ProgressBar: View {
    var value: Double
    var progressColor: Color = .yellow
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(.secondary)
                    .cornerRadius(25.0)
                
                Rectangle()
                    .frame(width: max(0, min(CGFloat(self.value) * geometry.size.width, geometry.size.width)), height: geometry.size.height)
                    .foregroundColor(progressColor)
                    .animation(.linear, value: value)
                    .cornerRadius(25.0)
            }
        }
    }
}

#Preview {
    ProgressBar(value: 0.7, progressColor: .red)
        .frame(height: 6)
        .padding(.horizontal, 16)
}
