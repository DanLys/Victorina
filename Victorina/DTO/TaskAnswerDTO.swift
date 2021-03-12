//
//  TaskAnswersDTO.swift
//  Victorina
//
//  Created by Danil Lyskin on 12.03.2021.
//

class TaskAnswerDTO {
    var answer: String
    var isTrue: Bool
    
    init(answer: String = "empty", isTrue: Bool = false) {
        self.answer = answer
        self.isTrue = isTrue
    }
}
