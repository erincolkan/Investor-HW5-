//
//  AuthManager.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 21.10.2021.
//

import Foundation
import FirebaseAuth

class AuthenticationManager: AuthenticationManagerProtocol {
    
    public static let shared = AuthenticationManager()
    
    private var toko: BooleanBlock?
    
    private init() { }
    
    func isLoggedIn(with completion: @escaping BooleanBlock) {
        Auth.auth().addStateDidChangeListener { auth, user in
            print("isLoggedIn \((user != nil) ? true : false)")
            completion((user != nil) ? true : false)
            self.toko?((user != nil) ? true : false)
        }
    }
    
    func toko(with completion: @escaping BooleanBlock) {
        toko = completion
    }
    
    func signIn(with request: SimpleAuthRequest) {
        Auth.auth().signIn(withEmail: request.email, password: request.password) { authDataResult, error in
            if error != nil {
                print("Error : \(String(describing: error))")
            }
            print("data : \(String(describing: authDataResult))")
            print("break")
        }
        
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("error : \(error)")
        }
    }
    
}
