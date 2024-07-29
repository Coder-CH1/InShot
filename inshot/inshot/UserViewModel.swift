//
//  ViewModel.swift
//  inshot
//
//  Created by Mac on 29/07/2024.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var dateOfBirth = ""
    @Published var nickname = ""
    
    func signIn() {
        guard !email.isEmpty && !password.isEmpty else {
            return
        }
    }
}
