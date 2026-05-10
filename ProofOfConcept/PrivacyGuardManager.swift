import Foundation
import Vision
import UIKit

class PrivacyGuardManager {
    @MainActor static let shared = PrivacyGuardManager()
    
    private var isActive = false
    private var currentFaceCount = 1
    private var sensor: TrueDepthSensor?
    private var visionDetector: VisionDetector?
    
    private init() {
        sensor = TrueDepthSensor()
        visionDetector = VisionDetector()
        sensor?.delegate = self
    }
    
    @MainActor
    func startMonitoring() {
        isActive = true
        sensor?.start()
    }
    
    @MainActor
    func stopMonitoring() {
        isActive = false
        sensor?.stop()
    }
    
    @MainActor
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
        guard let visionDetector = visionDetector else { return }
        let faceCount = visionDetector.detectFaces(in: pixelBuffer)
        Task { @MainActor in
            PrivacyGuardManager.shared.handleFaceCount(faceCount)
        }
    }
}
