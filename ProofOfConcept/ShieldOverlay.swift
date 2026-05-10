import UIKit

@MainActor
class ShieldOverlay {
    private static var overlayWindow: UIWindow?
    
    static func activate() {
        // NOTE: Full system-wide overlay requires private Apple APIs / special entitlements
        // This POC simulates the shield via UIWindow overlay for visual demo
        print("🛡️ Shield activated - Screen protected (simulated)")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            print("No active window scene")
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        window.windowLevel = .alert
        window.isHidden = false
        
        let label = UILabel()
        label.text = "PRIVACY SHIELD ACTIVE\nSecond face detected - Screen secured"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        window.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: window.centerYAnchor)
        ])
        
        overlayWindow = window
    }
    
    static func deactivate() {
        print("✅ Shield deactivated - Normal view restored (simulated)")
        overlayWindow?.isHidden = true
        overlayWindow = nil
    }
}