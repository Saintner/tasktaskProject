//
//  TTPAppEndpoint.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation

enum TTPAppEndpoint {
    case getTasks
}

extension TTPAppEndpoint {
    
    func rawValue() -> String {
        switch self {
        case .getTasks:
            return "/" + TVGAPIEndpoints.appointmentTypesPurposes.rawValue
        }
    }
    
    private enum TVGAPIEndpoints: String {
        case appointmentTypesPurposes = "AppointmentTypesPurposes"
    }
}
