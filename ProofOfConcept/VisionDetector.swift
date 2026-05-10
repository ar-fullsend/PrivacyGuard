// VisionDetector.swift
// Uses Neural Engine for face counting

import Vision

class VisionDetector {
    func detectFaces(in pixelBuffer: CVPixelBuffer, completion: @escaping (Int) -> Void) {
        // Vision request for face detection
        let request = VNDetectFaceRectanglesRequest { request, error in
            guard let results = request.results as? [VNFaceObservation] else {
                completion(1)
                return
            }
            completion(results.count)
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer).perform([request])
    }
}