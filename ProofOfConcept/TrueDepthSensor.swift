// TrueDepthSensor.swift
import AVFoundation
import UIKit

class TrueDepthSensor {
    private var session: AVCaptureSession?
    
    func configureSession() -> Bool {
        session = AVCaptureSession()
        guard let session = session else { return false }
        
        // Configure for low-res depth data from TrueDepth
        guard let device = AVCaptureDevice.default(.builtInTrueDepthCamera, for: .video, position: .front) else {
            return false
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if session.canAddInput(input) {
                session.addInput(input)
            }
            
            let output = AVCaptureVideoDataOutput()
            output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_420YpCbCr8BiPlanarFullRange]
            
            session.addOutput(output)
            return true
        } catch {
            print("TrueDepth setup failed: \(error)")
            return false
        }
    }
    
    func start() {
        session?.startRunning()
    }
    
    func stop() {
        session?.stopRunning()
    }
}