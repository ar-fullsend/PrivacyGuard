// PrivacyGuardManager.swift
// Main orchestrator for PrivacyGuard

import Foundation
import AVFoundation
import Vision

class PrivacyGuardManager {
    static let shared = PrivacyGuardManager()
    private var isActive = false
    private var currentFaceCount = 1
    
    private let sensor = TrueDepthSensor()
    private let detector = VisionDetector()
    
    func startMonitoring() {
        isActive = true
        print("PrivacyGuard: Monitoring started")
        if sensor.configureSession() {
            sensor.onFrameCaptured = { [weak self] pixelBuffer in
                guard let self = self, self.isActive else { return }
                self.detector.detectFaces(in: pixelBuffer) { [weak self] count in
                    guard let self = self, self.isActive else { return }
                    if count != self.currentFaceCount {
                        self.currentFaceCount = count
                        self.handleFaceCountChange(count)
                    }
                }
            }
            sensor.start()
        } else {
            print("PrivacyGuard: Failed to configure TrueDepth sensor")
        }
    }
    
    func stopMonitoring() {
        isActive = false
        sensor.stop()
        print("PrivacyGuard: Monitoring stopped")
    }
    
    // Callback for face detection change
    func handleFaceCountChange(_ count: Int) {
        if count > 1 {
            triggerShield()
        } else {
            restoreScreen()
        }
    }
    
    private func triggerShield() {
        print("🛡️ Shield activated - Screen protected")
        // TODO: Wire with ShieldOverlay.activate() for system-wide dim
    }
    
    private func restoreScreen() {
        print("✅ Screen restored")
        // TODO: Wire with ShieldOverlay.deactivate() for restore
    }
}