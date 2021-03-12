//
//  TaskPreviewService.swift
//  Victorina
//
//  Created by Danil Lyskin on 12.03.2021.
//

import Alamofire
import Foundation

class TaskPreviewService {
    
    static func getCountTaskPreview(complition: @escaping ((Int) -> Void)) {
        AF.request(ServerConfig.hostPort + "api/task/preview/count", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .validate()
            .responseString { response in
                var result = 0
                switch response.result {
                case .success:
                    do {
                        result = Int(try response.result.get()) ?? 10
                        complition(result)
                    } catch {
                        print("GOVNO")
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func getCurrentTaskPreview(with index: Int) -> TaskPreviewDTO {
        return TaskPreviewDTO()
    }
}
