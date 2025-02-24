//
//  StageView.swift
//  Remember
//
//  Created by 송지혁 on 2/21/25.
//

import SwiftUI

struct StageView: View {
    let stage: StageData
    @State private var currentItem: GameItem? = nil
    @State private var cleanedItems: [GameItem?] = Array(repeating: nil, count: 10)
    let next: () -> Void
    
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea()
            
            items(stage.items)
            
            collections
            
            if stage.itemCount == cleanedItems.compactMap({ $0 }).count {
                nextStage
                    .onTapGesture { next() }
            }
        }
        .transparentFullScreenCover(item: $currentItem) { items in
            if cleanedItems.contains(items) { ItemView(items: items, getOnly: true) }
            else {
                ItemView(items: items) {
                    let index = stage.items.firstIndex(of: items) ?? 0
                    cleanedItems[index] = items
                }
            }
        }
    }
    
    private var background: some View {
        Image(stage.background)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func items(_ items: [GameItem]) -> some View {
        ZStack {
            ForEach(stage.items, id: \.self) { item in
                Image(item.names[0])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .position(item.position)
                    .frame(width: item.sizes[0].width, height: item.sizes[0].height)
                    .onTapGesture {
                        currentItem = item
                    }
                    .opacity(cleanedItems.contains(item) ? 0 : 1)
            }
        }
    }
    
    private var collections: some View {
        HStack {
            VStack(spacing: 5) {
                ForEach(cleanedItems, id: \.self) { items in
                    if let items {
                        Image(items.names[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .onTapGesture {
                                currentItem = items
                            }
                    }
                }
            }
            Spacer()
           
        }
        .padding(.leading)
    }
    
    private var nextStage: some View {
        HStack {
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 30))
                .foregroundStyle(.white)
                .shadow(radius: 10)
        }
        .padding(.trailing)
    }
}
