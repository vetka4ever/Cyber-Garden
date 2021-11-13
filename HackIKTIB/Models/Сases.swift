//
//  Сases.swift
//  HackIKTIB
//
//  Created by Daniil on 11.11.2021.
//

import Foundation
import RealmSwift

// MARK: - Case
struct Case: Codable {
    var id: String = ""
    var name: String = ""
    var teams = [String:Team]()
}

// MARK: - Team
struct Team: Codable {
    var id: String = ""
    var name: String = ""
    var marks = [Int:Mark]()
}

// MARK: - Mark
struct Mark: Codable {
    var id: String = ""
    var markType: Int = 0
    var mark: Int = 0
}

//class CasesRealm : Object
//{
//    @objc private dynamic var classData: Data? = nil
//    var data: Cases?
//    {
//        get
//        {
//            if let currentData = classData
//            {
//                return try? JSONDecoder().decode(Cases.self, from: currentData)
//            }
//            return nil
//        }
//        set
//        {
//            classData = try? JSONEncoder().encode(newValue)
//        }
//    }
//}
