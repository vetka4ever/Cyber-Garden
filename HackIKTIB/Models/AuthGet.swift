//
//  AuthSend.swift
//  HackIKTIB
//
//  Created by Daniil on 08.11.2021.
//

import Foundation
struct AuthGet: Codable
{
    let user: User
    let token: String
}

// MARK: - User
struct User: Codable
{
    let id, login: String
    let firstName: String
    let lastName: String
}


