//
//  EndView.swift
//  Remember
//
//  Created by 송지혁 on 2/24/25.
//
import SwiftUI

struct EndView: View {
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(gameManager.stageData, id: \.self) { stage in
                    Text(stage.title)
                        .letterboxCaption(color: .white, size: 40)
                    
                    HStack(spacing: 12) {
                        ForEach(stage.items, id: \.self) { item in
                            VStack {
                                Image(item.names[0])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom, 5)
                                
                                Text(item.names[0])
                                    .letterboxCaption(color: .white, size: 20)
                                Text(item.descriptions[0])
                                    .letterboxCaption(color: .white, size: 14)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .padding(.bottom, 16)
                }
            }
            
            Spacer()
            
            HStack {
                Text("Title")
                    .letterboxCaption(color: .white, size: 20)
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    .shadow(radius: 10)
                    .onTapGesture {
                        gameManager.reset()
                        gameManager.moveToTitle()
                    }
            }
        }
        .padding()
    }
}
