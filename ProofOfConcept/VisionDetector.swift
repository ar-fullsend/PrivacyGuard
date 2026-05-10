// VisionDetector.swift
// Uses Neural Engine for face counting via VNDetectFaceRectanglesRequest
// Wired to receive CVPixelBuffer frames from TrueDepthSensor and report count changes to PrivacyGuardManager

import Vision
import CoreVideo

class VisionDetector {
    func detectFaces(in pixelBuffer: CVPixelBuffer, completion: @escaping (Int) -> Void) {
        // Vision request for face detection - runs on Neural Engine
        let request = VNDetectFaceRectanglesRequest { request, error in
            if let error = error {
                print("Vision error: \(error)")
                completion(1)
                return
            }
            guard let results = request.results as? [VNFaceObservation] else {
                completion(1)
                return
            }
            completion(results.count)
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer).perform([request])
    }
}