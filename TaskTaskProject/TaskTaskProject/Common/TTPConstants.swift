//
//  TTPConstants.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation

// - A struct to stored all app constants
struct TTPConstants {
    struct UrlConstants {
        static var scheme = "https"
        static var host = "appointmentrequestsapi-dev.symplast.com"
        static var invalidUrlComponents = "Invalid URL components:"
    }
    static var tasksListSearchQueryValue = "1007"
    static var tasksListSearchQueryName = "tenantId"
    static var fatalError = "init(coder:) has not been implemented"
    static var emptyString = ""
    static var taskListTableViewCellReusableIdentifier = "cell"
    static var somethingHappenedText = "Something Happened"
    static var somethingWentWrongText = "Somehitng went wrong try again later."
    static var tryAgainText = "Try Again"
}
