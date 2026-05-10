import AVFoundation
import CoreMedia
import UIKit

class TrueDepthSensor: NSObject {
    private let captureSession = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput()
    private var isRunning = false
    
    weak var delegate: TrueDepthSensorDelegate?
    
    override init() {
        super.init()
        setupSession()
    }
    
    private func setupSession() {
        guard let device = AVCaptureDevice.default(.builtInTrueDepthCamera, for: .video, position: .front) else {
            print("TrueDepth camera not available")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
            }
            
            videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            
            if captureSession.canAddOutput(videoOutput) {
                captureSession.addOutput(videoOutput)
            }
        } catch {
            print("Error setting up TrueDepth: \(error)")
        }
    }
    
    func start() {
        guard !isRunning else { return }
        captureSession.startRunning()
        isRunning = true
    }
    
    func stop() {
        guard isRunning else { return }
        captureSession.stopRunning()
        isRunning = false
    }
}

extension TrueDepthSensor: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        delegate?.didCaptureFrame(pixelBuffer: pixelBuffer)
    }
}

protocol TrueDepthSensorDelegate: AnyObject {
    func didCaptureFrame(pixelBuffer: CVPixelBuffer)
}