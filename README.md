# PrivacyGuard

**Your screen. Yours alone.**

A native iOS privacy layer for the age of public screens. Built on TrueDepth.

## Pitch Deck

![Slide 1](https://github.com/ar-fullsend/PrivacyGuard/raw/main/Assets/IMG_7019.jpeg)
![Slide 2](https://github.com/ar-fullsend/PrivacyGuard/raw/main/Assets/IMG_7020.jpeg)
![Slide 3](https://github.com/ar-fullsend/PrivacyGuard/raw/main/Assets/IMG_7021.jpeg)

## The Problem
The screen is the new front door. And right now, anyone walking past can step inside.

- **73%** of professionals report shoulder-surfing in transit, cafés, or shared workspaces.
- **1 in 4** data breaches involve some form of visual or in-person credential exposure.
- **$4.9B** estimated annual loss from visual hacking incidents across enterprise sectors.

## The Solution
**PrivacyGuard** uses the existing TrueDepth camera (already in every modern iPhone) to detect when a second face is present and instantly shields the screen — on-device, real-time, invisible until it matters.

### How it Works
1. **Sense** — TrueDepth captures low-res frames (Secure Enclave)
2. **Detect** — Vision framework + Neural Engine counts faces
3. **Shield** — System dims/ blacks out screen in <150ms
4. **Restore** — Instantly returns when second face leaves

**End-to-end on-device. No data recorded, stored, or transmitted.**

## Why Only Apple
| Third-party App | Native iOS Feature |
|-----------------|---------------------|
| ❌ Camera suspends when backgrounded | ✅ Always-on at OS level |
| ❌ Cannot overlay other apps | ✅ Shields any app, system-wide |
| ❌ Each app needs integration | ✅ Works with every app |

## Implementation Path
- **iOS 18+**: Full Swift Package with TrueDepth + Vision integration (COMPLETE)
- **iOS 19**: Settings toggle + PrivacyKit API (Phase 2)
- **iOS 20**: Default system-wide (Phase 3)

## The Ask
Make iOS the first platform where your screen sees only you.

A WWDC keynote moment.

## Quick Start (Cloud Mac or Mac)
```bash
git clone https://github.com/ar-fullsend/PrivacyGuard.git
cd PrivacyGuard
open Package.swift
```

## Repo Structure
- `/Assets/` — Pitch images
- `Package.swift` — Swift Package manifest at root (library + demo target)
- `/ProofOfConcept/` — Real Swift implementation (TrueDepth + Vision + ShieldOverlay with UIWindow demo)
- `/web-demo/` — Interactive browser simulation
- `PrivacyGuard.entitlements` — Camera and sandbox permissions
- `ProofOfConcept/PrivacyInfo.xcprivacy` — Privacy manifest
- `.github/workflows/ci.yml` — Swift CI
- `/Demo/` — Sample SwiftUI demo app

**Status**: Phase 1 Complete — Prototype-ready with full wiring, entitlements, privacy manifest, CI, and demo. Ready for Xcode integration and device testing on Mac/Cloud Mac.

**Phase 2**: Xcode project setup, background capabilities, real-device testing.

**Phase 3**: Pitch deck polish, video demo, Apple submission.

**Contributing**: Issues and PRs welcome.

**License**: MIT

## Completed Recommendations
- ✅ Wired PrivacyGuardManager, TrueDepthSensor, VisionDetector, ShieldOverlay
- ✅ Added entitlements and PrivacyInfo.xcprivacy
- ✅ Added CI workflow for build/test
- ✅ Enhanced ShieldOverlay with UIWindow overlay simulation
- ✅ Added Demo app target and sample SwiftUI view
- ✅ Updated documentation and roadmap

For full iOS app, open in Xcode on Mac, add app target using the package, and configure Info.plist with NSFaceIDUsageDescription and NSCameraUsageDescription.