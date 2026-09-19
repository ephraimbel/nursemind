import UIKit
import UserNotifications
import NursemindCore

/// UIKit delegate for the two things SwiftUI's App lifecycle cannot do:
/// receive the APNs device token and handle notification taps.
final class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        // A tap on a push that launched the app arrives here before any
        // scene exists; hand it to the router now so the first scene lands
        // on the right screen and the session is attributed.
        if let userInfo = launchOptions?[.remoteNotification] as? [AnyHashable: Any],
           let parsed = PushDeepLink.parse(userInfo: userInfo) {
            PushRegistrationService.shared.handleNotificationTap(link: parsed.link, kind: parsed.kind, logID: parsed.logID)
        }
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        PushRegistrationService.shared.didRegister(deviceToken: deviceToken)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        PushRegistrationService.shared.didFailToRegister(error)
    }

    /// Foreground delivery: show the banner; the payload is counts only.
    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound])
    }

    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        // Parse on this thread so only Sendable values cross to the main actor.
        let parsed = PushDeepLink.parse(userInfo: response.notification.request.content.userInfo)
        let done = UncheckedSendableBox(completionHandler)
        Task { @MainActor in
            if let parsed {
                PushRegistrationService.shared.handleNotificationTap(link: parsed.link, kind: parsed.kind, logID: parsed.logID)
            }
            done.value()
        }
    }
}

/// UNUserNotificationCenter's completion handlers are not marked Sendable
/// but are safe to call once from any thread.
private struct UncheckedSendableBox: @unchecked Sendable {
    let value: () -> Void
    init(_ value: @escaping () -> Void) { self.value = value }
}
