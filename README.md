# PrivacyGuard (iOS)

**Your screen. Yours alone.**

Real-time second-face detection for iOS using TrueDepth camera. Triggers an automatic privacy shield overlay when multiple faces are detected. Built with AVFoundation + Vision framework.

## Quick Start

1. Clone the repo
2. Open `Package.swift` in Xcode
3. Select the **PrivacyGuardDemo** scheme and run on a physical iPhone (TrueDepth required for best results)

Or build the library:
```bash
swift build
```

## Features
- TrueDepth front camera support
- On-device Vision face detection (<100ms)
- Automatic shield overlay on second face
- Full MainActor isolation for Swift 6 concurrency

## Project Structure
- `ProofOfConcept/` — Core library (PrivacyGuardManager, TrueDepthSensor, VisionDetector, ShieldOverlay)
- `Demo/` — Executable demo (command-line + notes for full Xcode app)
- `Tests/` — Unit tests
- `.github/workflows/ci.yml` — Simulator build CI

## Requirements
- iOS 18+
- iPhone with TrueDepth camera (iPhone X and later)
- Camera permission

## Future
- Full SwiftUI iOS app with live preview (in progress)
- System-wide overlay via private APIs

MIT License — privacy-first mobile protection.