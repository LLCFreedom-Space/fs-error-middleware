//
//  AppError.swift
//  
//
//  Created by Mykola Buhaiov on 25.03.2023.
//

import Vapor

public protocol AppError: AbortError, DebuggableError {
    /// The number for this error.
    var number: String { get }
}
