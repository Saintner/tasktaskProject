//
//  TTPTask.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation

struct Task: Codable {
    var id: Int
    var durationInMinutes: Int
    var overrideName: String
    var bookingDeposit: Double
    var appointmentTypeId: Int
    var appointmentPurposeId: Int
}
