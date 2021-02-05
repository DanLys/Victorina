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

class SimpleTask: AbstractTask {
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

class TasksDTO {
    var name: String = "empty"
    var hardLevel: Int = 0
    var tasks: [AbstractTask] = []
    
    init() {}
    
    init(name: String = "empty", hardLevel: Int = 0, tasks: [AbstractTask] = []) {
        self.name = name
        self.hardLevel = hardLevel
        self.tasks = tasks
    }
    
    func addTask(newElement task: AbstractTask) {
        tasks.append(task)
    }
    
    func addTask(contentsOf tasks: [AbstractTask]) {
        self.tasks.append(contentsOf: tasks)
    }
    
    func isInclude(by index: Int) -> Bool {
        return index < tasks.count
    }
    
    func getTask(byIndex index: Int) -> AbstractTask {
        return tasks[index]
    }
    
    func countOfTasks() -> Int {
        return tasks.count
    }
}


