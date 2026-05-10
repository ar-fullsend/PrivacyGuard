# PrivacyGuard

![PrivacyGuard Logo](https://via.placeholder.com/800x200/000/fff?text=PrivacyGuard)

**Your screen. Yours alone.**

A native iOS privacy layer for the age of public screens. Built on TrueDepth.

## Pitch Deck
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
- **iOS 19**: Settings toggle + PrivacyKit API
- **iOS 19.x**: Developer API for apps
- **iOS 20**: Default system-wide

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
- `/ProofOfConcept/` — Real Swift code (TrueDepth + Vision)
- `/web-demo/` — Interactive browser simulation
- `/Sources/` — Swift Package

**Status**: Prototype-ready. Ready for testing on device.

**Contributing**: Issues and PRs welcome.

**License**: MIT
