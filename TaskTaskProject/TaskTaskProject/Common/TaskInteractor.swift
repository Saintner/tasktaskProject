//
//  TTPInteractor.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation

protocol TTPInteractor {
    var presenter: TTPPresenter! { get set }
    var output: TTPInteractorOutput? { get set }
}

protocol TTPInteractorOutput {
    
}
