//
//  Сases.swift
//  HackIKTIB
//
//  Created by Daniil on 11.11.2021.
//

import Foundation
import RealmSwift

// MARK: - Case
struct Project: Codable {
    var id: String = ""
    var name: String = ""
    var teams = [String:Team]()
    var description = ""
}

// MARK: - Team
struct Team: Codable {
    var id: String = ""
    var name: String = ""
    var marks = [Int:Mark]()
    var description = ""
}

// MARK: - Mark
struct Mark: Codable {
    var id: String = ""
    var markType: Int = 0
    var mark: Int = 0
}

class ProjectRealm : Object
{
    @objc private dynamic var classData: Data? = nil
    var data: Project?
    {
        get
        {
            if let currentData = classData
            {
                return try? JSONDecoder().decode(Project.self, from: currentData)
            }
            return nil
        }
        set
        {
            classData = try? JSONEncoder().encode(newValue)
        }
    }
}

class KeepingProjectRealm : Object
{
    @objc private dynamic var classData: Data? = nil
    var data: Project?
    {
        get
        {
            if let currentData = classData
            {
                return try? JSONDecoder().decode(Project.self, from: currentData)
            }
            return nil
        }
        set
        {
            classData = try? JSONEncoder().encode(newValue)
        }
    }
}
