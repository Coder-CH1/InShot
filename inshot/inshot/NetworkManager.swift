//
//  NetworkingManager.swift
//  inshot
//
//  Created by Mac on 27/07/2024.
//

import Foundation

//struct RegistrationRequest: Codable {
//    let email: String
//    let password: String
//    let dateOfBirth: String
//    let nickName: String
//}
//
//struct RegistrationResponse: Codable {
//    let message: String
//}
//
//enum NetworkError: Error {
//    case invalidUrl
//    case noData
//}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func registerUser(email: String, password: String, dateOfBirth: Date, nickName: String, completion: @escaping (Result<String,Error>)  -> Void) {
        
    }
}

