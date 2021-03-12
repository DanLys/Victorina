//
//  TaskPreviewService.swift
//  Victorina
//
//  Created by Danil Lyskin on 12.03.2021.
//

import Alamofire
import SwiftyJSON

class TaskPreviewService {
    
    static let decoder = JSONDecoder()
    
    static func getTasksPreview(complition: @escaping ([TaskPreviewDTO]) -> Void) {
        AF.request(ServerConfig.hostPort + ServerConfig.getAllTaskPreview, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    var result = [TaskPreviewDTO]()
                    
                    for i in 0..<json.count {
                        result.append(JSONToTaskPreview(json[i]))
                    }
                    
                    complition(result)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private static func JSONToTaskPreview(_ json: JSON) -> TaskPreviewDTO {
        let resultTask = TaskPreviewDTO()
        resultTask.id = Int.init(json["id"].stringValue) ?? 0
        resultTask.name = json["name"].stringValue == "" ? "empty" : json["name"].stringValue
        resultTask.count = Int.init(json["countOfTasks"].stringValue) ?? 0
        resultTask.hardLevel = Int.init(json["hardLevel"].stringValue) ?? 0
        
        return resultTask
    }
}
