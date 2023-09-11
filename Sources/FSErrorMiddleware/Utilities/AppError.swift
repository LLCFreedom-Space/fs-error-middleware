//
//  AppError.swift
//  
//
//  Created by Mykola Buhaiov on 25.03.2023.
//  Copyright © 2023 Freedom Space LLC
//  All rights reserved: http://opensource.org/licenses/MIT
//

import Vapor

public protocol AppError: AbortError, DebuggableError {
    /// The number for this error.
    var number: String { get }
}
