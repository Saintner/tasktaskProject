//
//  TTPError.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation

// A base error Enum with a map method
enum TTPError: Error {
  case statusCode
  case decoding
  case invalidURL
  case other(Error)
  
  static func map(_ error: Error) -> TTPError {
    return (error as? TTPError) ?? .other(error)
  }
}
