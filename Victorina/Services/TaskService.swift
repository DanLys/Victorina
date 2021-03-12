//
//  TaskService.swift
//  Victorina
//
//  Created by Danil Lyskin on 11.03.2021.
//

import Alamofire

class TaskService {
    
    static func getCurrentTask(with index: Int, and taskPreviewId: Int) -> AbstractTask? {
        AF.request(ServerConfig.hostPort + "api/task/find/\(index)/\(taskPreviewId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .responseJSON { response in
                print(response)
            }
        return nil
    }
}
