//
//  TTPPresenter.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation

protocol TTPPresenter {
    var view: TTPView! { get set }
    var interactor: TTPInteractor! { get set }
    var router: TTPRouter! { get set }
}
