//
//  AuthenticationCoordinator.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

enum AuthenticationDestination: Destination {
    case initial
//    case signIn
//    case signUp
//    case forgotPassword
//    case privacyPolicy
}

final class AuthenticationCoordinator: NavigationCoordinator<AuthenticationDestination> {
  
    override func prepareToStart() {
        dependencyContainer.register(AuthenticationUseCase())
    }
    
    override func prepareNavigationTransition(for destination: AuthenticationDestination) -> NavigationTransition {
        switch destination {
        case .initial:
//            let signInViewController = SignInAssembly(self.dependencyContainer).viewController(coordinator: unownedRouter)
//            return .setSingleViewController(signInViewController)
            return .none()
//        case .signIn:
//            let signInViewController = SignInAssembly(self.dependencyContainer).viewController(coordinator: unownedRouter)
//            return .push(signInViewController)
//        case .signUp:
//            let signUpViewController = RegistrationAssembly(self.dependencyContainer).viewController(coordinator: unownedRouter)
//            return .push(signUpViewController)
//        case .forgotPassword:
//            let forgotPassViewController = ForgotPassAssembly(self.dependencyContainer).viewController(coordinator: unownedRouter)
//            return .push(forgotPassViewController)
//        case .privacyPolicy:
//            return .present(PolicyViewController(), presentationStyle: .pageSheet)
        }
    }
}
