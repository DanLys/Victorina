//
//  TasksDTO.swift
//  Victorina
//
//  Created by Danil Lyskin on 30.01.2021.
//

import UIKit

protocol AbstractTask {
    var name: String { get set }
    var descriptions: String { get set }
    var answers: [(String, Bool)] { get set }
    var flagOfAnsweresType: Bool { get set }
}

class SimpleTaskDTO: AbstractTask {
    var name: String
    var descriptions: String
    var answers: [(String, Bool)]
    var flagOfAnsweresType: Bool
    
    init(name: String = "empty", descriptions: String = "empty", answers: [(String, Bool)] = [], flagOfAnsweresType: Bool = false) {
        self.name = name
        self.descriptions = descriptions
        self.answers = answers
        self.flagOfAnsweresType = flagOfAnsweresType
    }
}

class TaskImageDTO: AbstractTask {
    var name: String
    var descriptions: String
    var answers: [(String, Bool)]
    var flagOfAnsweresType: Bool
    
    var image: UIImage?
    
    init(name: String = "empty", descriptions: String = "empty", image: UIImage? = nil,
         answers: [(String, Bool)] = [], flagOfAnsweresType: Bool = false) {
        self.name = name
        self.descriptions = descriptions
        self.answers = answers
        self.flagOfAnsweresType = flagOfAnsweresType
        self.image = image
    }
}

class TaskVideDTO: AbstractTask {
    var name: String
    var descriptions: String
    var answers: [(String, Bool)]
    var flagOfAnsweresType: Bool
    
    var video: UIVideoEditorController?
    
    init(name: String = "empty", descriptions: String = "empty", video: UIVideoEditorController? = nil,
         answers: [(String, Bool)] = [], flagOfAnsweresType: Bool = false) {
        self.name = name
        self.descriptions = descriptions
        self.answers = answers
        self.flagOfAnsweresType = flagOfAnsweresType
        self.video = video
    }
}

class TaskPreviewDTO: Codable {
    var id: Int
    var name: String
    var hardLevel: Int
    var count: Int
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case hardLevel
        case count
    }
    
    init(id: Int = 0, name: String = "empty", hardLevel: Int = 0, count: Int = 0) {
        self.id = id
        self.name = name
        self.hardLevel = hardLevel
        self.count = count
    }
}
