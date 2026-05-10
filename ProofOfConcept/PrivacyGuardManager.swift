import Foundation
import Vision
import UIKit

@MainActor
class PrivacyGuardManager {
    static let shared = PrivacyGuardManager()
    
    private var isActive = false
    private var currentFaceCount = 1
    private var sensor: TrueDepthSensor?
    private var visionDetector: VisionDetector?
    
    private init() {
        sensor = TrueDepthSensor()
        visionDetector = VisionDetector()
        sensor?.delegate = self
    }
    
    func startMonitoring() {
        isActive = true
        sensor?.start()
    }
    
    func stopMonitoring() {
        isActive = false
        sensor?.stop()
    }
    
    private func handleFaceCount(_ count: Int) {
        currentFaceCount = count
        if count > 1 {
            ShieldOverlay.activate()
        } else {
            ShieldOverlay.deactivate()
        }
    }
}

extension PrivacyGuardManager: TrueDepthSensorDelegate {
    nonisolated func didCaptureFrame(pixelBuffer: CVPixelBuffer) {
        Task { @MainActor in
            await self.visionDetector?.detectFaces(in: pixelBuffer) { [weak self] faceCount in
                self?.handleFaceCount(faceCount)
            }
        }
    }
}