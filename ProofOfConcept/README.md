# ProofOfConcept

This directory contains the wired Swift implementation for PrivacyGuard using TrueDepth and Vision framework.

**Wiring complete** (three classes integrated):
- `TrueDepthSensor` captures live video frames from front TrueDepth camera via `AVCaptureVideoDataOutputSampleBufferDelegate` and emits `CVPixelBuffer` via `onFrameCaptured` closure.
- `VisionDetector` receives frames, runs `VNDetectFaceRectanglesRequest` on Neural Engine, returns face count via completion handler (with error handling).
- `PrivacyGuardManager` owns both, starts/stops monitoring, wires frame callback to detection, tracks `currentFaceCount`, calls `handleFaceCountChange` on delta, triggers shield/restore.

Core files:
- PrivacyGuardManager.swift (orchestrator + integration)
- TrueDepthSensor.swift (camera + delegate)
- VisionDetector.swift (face counting)
- ShieldOverlay.swift (placeholder for future UI wiring)