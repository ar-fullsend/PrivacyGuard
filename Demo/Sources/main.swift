// Demo/Sources/main.swift
// Simple demo app for PrivacyGuard

import PrivacyGuard

import SwiftUI

@main
struct PrivacyGuardDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var isMonitoring = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("PrivacyGuard Demo")
                .font(.largeTitle)
            
            Text("TrueDepth Face Detection Shield")
                .font(.headline)
            
            Button(isMonitoring ? "Stop Monitoring" : "Start Monitoring") {
                if isMonitoring {
                    PrivacyGuardManager.shared.stopMonitoring()
                    isMonitoring = false
                } else {
                    PrivacyGuardManager.shared.startMonitoring()
                    isMonitoring = true
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text("Shield activates on second face detection")
                .font(.caption)
        }
        .padding()
    }
}