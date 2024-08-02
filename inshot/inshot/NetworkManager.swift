//
//  NetworkingManager.swift
//  inshot
//
//  Created by Mac on 27/07/2024.
//

import Foundation

struct ErrorResponse: Codable {
    let error: String
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    let endpoint = "http://localhost:3004/send-code"
    
    func sendCode(email: String, completion: @escaping (Result<String,Error>)  -> Void) {
        let url = URL(string: endpoint)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["eamail" : email]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }

            if let jsonString = String(data: data ?? Data(), encoding: .utf8) {
                    print("Received data: \(jsonString)")
                }

            guard let data = data else {
                print("no data received")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("\(json)")

            } catch {
                print("\(error.localizedDescription)")
            }
        }.resume()
    }
    
    func setPassword(password: String, completion: @escaping (Result<String,Error>)  -> Void) {
        
    }
    
    func setDateOfBirth(dateOfBirth: String, completion: @escaping (Result<String,Error>)  -> Void) {
        
    }
    
    func setNickname(nickname: String, completion: @escaping (Result<String,Error>)  -> Void) {
        
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Result<String,Error>)  -> Void) {
        
    }
    
    func logoutUser(completion: @escaping (Result<String,Error>)  -> Void) {
        
    }
    
    func verifyCode(email: String, code: String, completion: @escaping (Result<String,Error>)  -> Void) {
        
    }
}

