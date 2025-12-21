//
//  ReceiptScan.swift
//  ReceiptScan
//
//  Created by Алина Кутузова on 16.12.2025.
//

import Foundation

struct ContactData: Equatable {
    let userName: String
    let password: String
    let email: String
}

struct Contact: Equatable {
    let userName: String
    let password: String
    let email: String
}

extension Contact {
    static func make(from data: [String: Any], documentID: String) -> Contact? {
        guard
            let userName = data["firstName"] as? String,
            let password = data["lastName"] as? String,
            let email = data["phoneNumber"] as? String
        else {
            return nil
        }

        return Contact(userName: userName, password: password, email: email)
    }
}

extension ContactData {
    func toDict() -> [String: Any] {
        [
            "userName": userName,
            "email": email,
            "password": password
        ]
    }
}
