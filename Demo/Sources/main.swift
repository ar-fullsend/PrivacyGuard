import Foundation
import PrivacyGuard

print("PrivacyGuard iOS Demo - Real-time face detection")
print("This is a command-line demonstration of the core library.")
print("For full iOS app with camera preview, open the package in Xcode and add a SwiftUI target.")

let manager = PrivacyGuardManager.shared

print("\nStarting monitoring (simulated on non-iOS)...")
manager.startMonitoring()

// Simulate for demo
DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    print("Simulating second face detected - Shield would activate here on real device.")
    manager.stopMonitoring()
    print("Demo complete. In real iOS app this runs with TrueDepth camera.")
    exit(0)
}

RunLoop.main.run()