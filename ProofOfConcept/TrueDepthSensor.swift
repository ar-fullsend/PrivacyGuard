// TrueDepthSensor.swift
// Fixed: Uses AVCaptureVideoDataOutput with explicit low-resolution format selection
// and conservative frame rate for efficient, privacy-focused face detection.
// Reverted from depth map (which fails Vision face detection) to proper video frames.

import AVFoundation
import CoreMedia

class TrueDepthSensor {
    private var session: AVCaptureSession?
    var onFrameCaptured: ((CVPixelBuffer) -> Void)?
    
    func configureSession() -> Bool {
        session = AVCaptureSession()
        guard let session = session else { return false }
        
        // Use video media type for TrueDepth (provides proper image frames for Vision)
        guard let device = AVCaptureDevice.default(.builtInTrueDepthCamera, for: .video, position: .front) else {
            return false
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if session.canAddInput(input) {
                session.addInput(input)
            }
            
            // Explicit low-res format selection (640x480 or lower for efficiency/privacy)
            if let lowResFormat = device.formats.first(where: { format in
                let dims = CMVideoFormatDescriptionGetDimensions(format.formatDescription)
                return dims.width <= 640 && dims.height <= 480
            }) {
                do {
                    try device.lockForConfiguration()
                    device.activeFormat = lowResFormat
                    // Set conservative frame rate for low power
                    if let frameRateRange = lowResFormat.videoSupportedFrameRateRanges.first {
                        device.activeVideoMinFrameDuration = CMTimeMake(value: 1, timescale: 15) // ~15fps max
                        device.activeVideoMaxFrameDuration = frameRateRange.maxFrameDuration
                    }
                    device.unlockForConfiguration()
                    print("TrueDepthSensor: Set explicit low-res format \(lowResFormat)")
                } catch {
                    print("TrueDepthSensor: Failed to lock/set low-res format: \(error)")
                }
            }
            
            // Use Video Data Output for proper CVPixelBuffer images compatible with Vision
            let videoOutput = AVCaptureVideoDataOutput()
            videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_420YpCbCr8BiPlanarFullRange]
            
            let videoQueue = DispatchQueue(label: "com.privacyguard.videoQueue")
            videoOutput.setSampleBufferDelegate(self, queue: videoQueue)
            
            if session.canAddOutput(videoOutput) {
                session.addOutput(videoOutput)
            }
            
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

extension TrueDepthSensor: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        onFrameCaptured?(pixelBuffer)
    }
}