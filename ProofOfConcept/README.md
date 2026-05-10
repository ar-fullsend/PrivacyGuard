# ProofOfConcept

This directory contains the fully wired Swift implementation for PrivacyGuard using TrueDepth and Vision framework.

**Wiring complete** (all classes integrated and connected):
- `TrueDepthSensor` captures live video frames from front TrueDepth camera via `AVCaptureVideoDataOutputSampleBufferDelegate` and emits `CVPixelBuffer` via `onFrameCaptured` closure.
- `VisionDetector` receives frames, runs `VNDetectFaceRectanglesRequest` on Neural Engine, returns face count via completion handler (with error handling).
- `PrivacyGuardManager` owns both, starts/stops monitoring, wires frame callback to detection, tracks `currentFaceCount`, calls `handleFaceCountChange` on delta → triggers `ShieldOverlay`.
- `ShieldOverlay` provides activate/deactivate (simulated for POC; full system-wide requires Apple private APIs).

Core files:
- PrivacyGuardManager.swift (orchestrator + full integration)
- TrueDepthSensor.swift (camera + delegate)
- VisionDetector.swift (face counting)
- ShieldOverlay.swift (shield activation)