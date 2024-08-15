//
//  AuthenticationUseCase.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation
// import FirebaseFirestore.FIRTimestamp

final class AuthenticationUseCase {    
//    weak var signInDelegate: SignInDelegate? {
//        didSet {
//            authenticationService.signInDelegate = signInDelegate
//        }
//    }
//    
//    weak var signUpDelegate: SignUpDelegate? {
//        didSet {
//            authenticationService.signUpDelegate = signUpDelegate
//        }
//    }
//    
//    weak var forgotPasswordDelegate: ForgotPasswordDelegate? {
//        didSet {
//            authenticationService.forgotPasswordDelegate = forgotPasswordDelegate
//        }
//    }
    
//    private let authenticationService = AuthenticationService()
//    private let firestoreService = FirestoreService()
   
//    func signIn(email: String, password: String) {
//        authenticationService.signIn(email: email, password: password)
//    }
//    
//    func signUp(_ newUser: NewUser) {
//        authenticationService.signUp(newUser: newUser)
//    }
//    
//    func forgotPassword(email: String) {
//        authenticationService.sendPasswordReset(email: email)
//    }
//    
//    func autoAuthentication() {
//        authenticationService.automaticUserAuthentication()
//    }
//    
//    func fetchUserProfile(userID: String, completionHandler: @escaping (UserProfile) -> Void = { _ in }) {
//        Task {
//            do {
//                let userProfile = try await firestoreService.fetchUserData(userID: userID)
//                completionHandler(userProfile)
//            } catch {
//                print(error)
//            }
//        }
//    }
//    
//    func getToken(_ id: String?, completion: @escaping (Result<TokenCodable, FirestoreService.FirestoreServiceError>) -> Void = { _ in }) {
//        Task {
//            do {
//                guard let id = id else { return }
//                let tokenCodable = try await firestoreService.fetchToken(id)
//                completion(.success(tokenCodable))
//            } catch {
//                completion(.failure(.invalidToken))
//                print(error)
//            }
//        }
//    }
//    
//    func createUserProfile(newUser: NewUser, userID: String, token: TokenCodable?, completion: @escaping (Result<UserProfile, FirestoreService.FirestoreServiceError>) -> Void = { _ in }) {
//        Task {
//            let newUserProfile = UserProfile(
//                id: userID,
//                clubID: token?.clubID ?? UUID().uuidString,
//                userType: token?.userType ?? .admin,
//                firstName: newUser.firstName,
//                middleName: "",
//                lastName: newUser.lastName,
//                birthday: Timestamp(date: newUser.birthday ?? Date()),
//                phone: "",
//                email: newUser.email,
//                info: "",
//                token: token?.code ?? "",
//                totalRankPoints: nil,
//                cards: [],
//                tokens: []
//            )
//            
//            do {
//                try await firestoreService.createObjectDocument(id: userID, newUserProfile, collection: .userProfile)
//                completion(.success(newUserProfile))
//            } catch (let error){
//                completion(.failure(.firestoreError(error)))
//            }
//        }
//    }
}
