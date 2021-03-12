//
//  TaskAnswersService.swift
//  Victorina
//
//  Created by Danil Lyskin on 12.03.2021.
//

import Alamofire
import SwiftyJSON

class TaskAnswersService {
    
    static func getAllAnswers(with id: Int, complition: @escaping ([TaskAnswerDTO]) -> Void) {
        AF.request(ServerConstants.hostPort + ServerConstants.getTaskAnswersByTaskIndex + "\(id)",
                   method: .get,
                   encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(id)
                    print(json)
                    
                    var result = [TaskAnswerDTO]()
                    
                    for i in 0..<json.count {
                        result.append(JSONToTaskAnswer(json[i]))
                    }
                    complition(result)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private static func JSONToTaskAnswer(_ json: JSON) -> TaskAnswerDTO {
        let answer = TaskAnswerDTO()
        
        answer.answer = json["answer"].stringValue
        answer.isTrue = json["isTrue"].stringValue == "true"
        return answer
    }
}
