//
//  TTPRouter.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation
import UIKit

typealias EntryPoint = TTPView & UIViewController
protocol TTPRouter {
    var entry: EntryPoint? { get }
    static func start() -> TTPRouter
}
