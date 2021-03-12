//
//  TasksDTO.swift
//  Victorina
//
//  Created by Danil Lyskin on 30.01.2021.
//

import UIKit

protocol AbstractTask {
    var id: Int { get set }
    var name: String { get set }
    var descriptions: String { get set }
    var answers: [TaskAnswerDTO] { get set }
    var flagOfAnsweresType: Bool { get set }
}

class SimpleTaskDTO: AbstractTask {
    var id: Int
    var name: String
    var descriptions: String
    var answers: [TaskAnswerDTO]
    var flagOfAnsweresType: Bool
    
    init(id: Int = 0, name: String = "empty", descriptions: String = "empty", answers: [TaskAnswerDTO] = [], flagOfAnsweresType: Bool = false) {
        self.id = id
        self.name = name
        self.descriptions = descriptions
        self.answers = answers
        self.flagOfAnsweresType = flagOfAnsweresType
    }
}

class TaskImageDTO: AbstractTask {
    var id: Int
    var name: String
    var descriptions: String
    var answers: [TaskAnswerDTO]
    var flagOfAnsweresType: Bool
    
    var image: UIImage?
    
    init(id: Int = 0, name: String = "empty", descriptions: String = "empty", image: UIImage? = nil,
         answers: [TaskAnswerDTO] = [], flagOfAnsweresType: Bool = false) {
        self.id = id
        self.name = name
        self.descriptions = descriptions
        self.answers = answers
        self.flagOfAnsweresType = flagOfAnsweresType
        self.image = image
    }
}

class TaskVideDTO: AbstractTask {
    var id: Int
    var name: String
    var descriptions: String
    var answers: [TaskAnswerDTO]
    var flagOfAnsweresType: Bool
    
    var video: UIVideoEditorController?
    
    init(id: Int = 0, name: String = "empty", descriptions: String = "empty", video: UIVideoEditorController? = nil,
         answers: [TaskAnswerDTO] = [], flagOfAnsweresType: Bool = false) {
        self.id = id
        self.name = name
        self.descriptions = descriptions
        self.answers = answers
        self.flagOfAnsweresType = flagOfAnsweresType
        self.video = video
    }
}

class TaskPreviewDTO {
    var id: Int
    var name: String
    var hardLevel: Int
    var count: Int
    
    init(id: Int = 0, name: String = "empty", hardLevel: Int = 0, count: Int = 0) {
        self.id = id
        self.name = name
        self.hardLevel = hardLevel
        self.count = count
    }
}
