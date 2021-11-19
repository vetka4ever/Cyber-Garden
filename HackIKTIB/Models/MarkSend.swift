//
//  MarkSend.swift
//  HackIKTIB
//
//  Created by Daniil on 13.11.2021.
//

import Foundation
import RealmSwift
struct MarkSend: Codable
{
    let markType: Int
    let mark: Int
}

struct MarkDictionary: Codable
{
    var markType = [String:Int]()
}

class TypeOfMarkRealm: Object
{
    @objc private dynamic var classData: Data? = nil
    
    var data: MarkDictionary?
    {
        get
        {
            if let currentData = classData
            {
                return try? JSONDecoder().decode(MarkDictionary.self, from: currentData)
            }
            return nil
        }
        set
        {
            classData = try? JSONEncoder().encode(newValue)
        }
    }
    
}

