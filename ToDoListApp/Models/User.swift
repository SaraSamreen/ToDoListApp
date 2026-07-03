//
//  User.swift
//  ToDoListApp
//
//  Created by Mac on 02/07/2026.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
