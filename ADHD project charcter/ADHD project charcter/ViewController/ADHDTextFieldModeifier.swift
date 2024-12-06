//
//  ADHDTextFieldModeifier.swift
//  ADHD project charcter
//
//  Created by student on 21/11/24.
//

import SwiftUI

struct ADHDTextFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,24)
    }
}
