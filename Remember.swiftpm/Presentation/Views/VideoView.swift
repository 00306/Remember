//
//  VideoView.swift
//  Remember
//
//  Created by 송지혁 on 2/23/25.
//

import AVKit
import SwiftUI


struct VideoView: View {
    let name: String
    let fileExtension: String
    
    @State private var player: AVQueuePlayer = AVQueuePlayer()
    @State private var looper: AVPlayerLooper?
    
    var body: some View {
        VideoPlayer(player: player)
            .aspectRatio(contentMode: .fill)
            .onAppear { setupPlayer() }
            .onDisappear { player.pause() }
        
    }
    
    private func setupPlayer() {
        guard let url = Bundle.main.url(forResource: name, withExtension: fileExtension) else {
            print("Video file not found.")
            return
        }
        
        let firstItem = AVPlayerItem(url: url)
        player.insert(firstItem, after: nil)
        
        let asset = AVURLAsset(url: url)
        let loopItem = AVPlayerItem(asset: asset)
        
        let startTime = CMTime(seconds: 1, preferredTimescale: 1)
        let range = CMTimeRange(start: startTime, end: asset.duration)
        
        looper = AVPlayerLooper(player: player,
                                templateItem: loopItem,
                                timeRange: range)
        
        player.play()
    }
}
