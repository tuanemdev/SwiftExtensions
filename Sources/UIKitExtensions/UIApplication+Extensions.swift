//
//  UIApplication+Extensions.swift
//  SwiftExtensions
//

import UIKit
import SwiftUI

public extension UIApplication {
    var currentKeyWindow: UIWindow? {
        if #available(iOS 15, *) {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
                .first?
                .keyWindow
        } else if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    func topViewController(controller: UIViewController? = UIApplication.shared.currentKeyWindow?.rootViewController) -> UIViewController? {
        if let tabBarController = controller as? UITabBarController,
           let selectedViewController = tabBarController.selectedViewController {
            return topViewController(controller: selectedViewController)
        }
        if let navigationController = controller as? UINavigationController,
           let visibleViewController = navigationController.visibleViewController {
            return topViewController(controller: visibleViewController)
        }
        if let presentedViewController = controller?.presentedViewController {
            return topViewController(controller: presentedViewController)
        }
        return controller
    }
    
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    func changeRoot<Content>(to view: Content) where Content: View {
        UIApplication.shared.currentKeyWindow?.rootViewController = UIHostingController(rootView: view)
    }
}
