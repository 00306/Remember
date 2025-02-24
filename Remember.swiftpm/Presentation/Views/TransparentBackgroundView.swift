//
//  File.swift
//  Remember
//
//  Created by 송지혁 on 2/21/25.
//

import SwiftUI

struct TransparentBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

extension View {
    func transparentFullScreenCover<Item: Identifiable, Content: View>(
        item: Binding<Item?>,
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View {
        self.fullScreenCover(item: item) { selectedItem in
            ZStack {
                TransparentBackgroundView()
                content(selectedItem)
            }
            .background(TransparentBackgroundView())
        }
    }
}
