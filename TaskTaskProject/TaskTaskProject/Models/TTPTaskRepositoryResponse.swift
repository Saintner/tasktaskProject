//
//  TTPTaskRepositoryResponse.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation

struct TTPTaskRepositoryResponse: Codable {
    var version: String
    var statusCode: Int
    var result: [Task]
}
