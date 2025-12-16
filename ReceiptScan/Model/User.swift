//
//  User.swift
//  ReceiptScan
//
//  Created by Алина Кутузова on 16.12.2025.
//

import Foundation
import FirebaseFirestore

struct AppUser: Identifiable, Codable {
    @DocumentID var id: String?
    var username: String
    var email: String
    var dateCreated: Date 
}
