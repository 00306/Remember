//
//  AudioManager.swift
//  Remember
//
//  Created by 송지혁 on 2/24/25.
//
import Foundation
import AVKit

class AudioManager: ObservableObject {
    var backgroundPlayer: AVAudioPlayer?
    var effectPlayer: AVAudioPlayer?

    func playBackgroundMusic(named fileName: String) {
        if backgroundPlayer != nil { return }
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            do {
                backgroundPlayer = try AVAudioPlayer(contentsOf: url)
                backgroundPlayer?.numberOfLoops = -1
                backgroundPlayer?.play()
            } catch {
                print("음원 파일 재생 오류: \(error.localizedDescription)")
            }
        } else {
            print("파일을 찾을 수 없습니다: \(fileName).mp3")
        }
    }
    
    func playEffectSound(named fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            do {
                effectPlayer = try AVAudioPlayer(contentsOf: url)
                effectPlayer?.volume = 1.0
                effectPlayer?.play()
            } catch {
                print("음원 파일 재생 오류: \(error.localizedDescription)")
            }
        } else {
            print("파일을 찾을 수 없습니다: \(fileName).mp3")
        }
    }

    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }
}
