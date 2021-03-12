//
//  TaskService.swift
//  Victorina
//
//  Created by Danil Lyskin on 11.03.2021.
//

import Alamofire
import SwiftyJSON

class TaskService {
    
    static var task: AbstractTask?
    
    static func getCurrentTask(with index: Int, and taskPreviewId: Int, complition: @escaping (AbstractTask?) -> Void) {
        AF.request(ServerConstants.hostPort + ServerConstants.getTaskByIndexAndPreviewId + "\(index)/\(taskPreviewId)",
                   method: .get,
                   encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print(JSON(value))
                    
                    task = JSONToAbstractTask(json: JSON(value))
                    guard task != nil && task?.id != nil else {
                        complition(task)
                        return
                    }
                    
                    TaskAnswersService.getAllAnswers(with: task!.id) { answers in
                        TaskService.task?.answers = answers
                        complition(task)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private static func JSONToAbstractTask(json: JSON) -> AbstractTask? {
        
        var resultTask: AbstractTask
        
        let type = json["type"].stringValue
        switch type {
        case "TEXT":
            resultTask = SimpleTaskDTO()
        case "IMAGE":
            resultTask = TaskImageDTO()
        default:
            return nil
        }
        
        resultTask.id = Int.init(json["id"].stringValue) ?? 0
        resultTask.name = json["name"].stringValue == "" ? "empty" : json["name"].stringValue
        resultTask.descriptions = json["descriptions"].stringValue
        resultTask.flagOfAnsweresType = Bool.init(json["flagOfCountAnswers"].stringValue) ?? false
        
        return resultTask
    }
}
