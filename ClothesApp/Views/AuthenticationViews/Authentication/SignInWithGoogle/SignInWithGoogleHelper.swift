//
//  SignInWithGoogleHelper.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 28.07.23.
//

import GoogleSignIn
import GoogleSignInSwift
import Foundation

struct GoogleSignInResult {
    let idToken: String
    let accessToken: String
}

final class SignInWithGoogleHelper {
    
    @MainActor
        func signIn(viewController: UIViewController? = nil) async throws -> GoogleSignInResult {
            guard let topViewController = viewController ?? topViewController() else {
                throw AuthError.noTopView
            }
            
            let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topViewController)
            
            guard let idToken = gidSignInResult.user.idToken?.tokenString else {
                throw AuthError.unknown
            }
            
            let accessToken = gidSignInResult.user.accessToken.tokenString
            return GoogleSignInResult(idToken: idToken, accessToken: accessToken)
        }
    
    @MainActor
        func topViewController(controller: UIViewController? = nil) -> UIViewController? {
            let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
            
            if let navigationController = controller as? UINavigationController {
                return topViewController(controller: navigationController.visibleViewController)
            }
            if let tabController = controller as? UITabBarController {
                if let selected = tabController.selectedViewController {
                    return topViewController(controller: selected)
                }
            }
            if let presented = controller?.presentedViewController {
                return topViewController(controller: presented)
            }
            return controller
        }
}
