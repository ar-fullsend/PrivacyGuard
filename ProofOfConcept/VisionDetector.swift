import Vision
import CoreVideo
import UIKit

class VisionDetector {
    private let faceDetectionRequest = VNDetectFaceRectanglesRequest()
    
    func detectFaces(in pixelBuffer: CVPixelBuffer, completion: @escaping (Int) -> Void) {
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        
        do {
            try handler.perform([faceDetectionRequest])
            if let results = faceDetectionRequest.results {
                completion(results.count)
            } else {
                completion(0)
            }
        } catch {
            print("Vision error: \(error)")
            completion(0)
        }
    }
}