// FS Error Middleware
// Copyright (C) 2024  FREEDOM SPACE, LLC

//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published
//  by the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

//
//  ErrorResponse.swift
//
//
//  Created by Mykola Buhaiov on 14.06.2024.
//

import Vapor

/// Body for error response
public struct ErrorResponse: Content {
    /// Some Error in `Bool` error.
    public var isError: Bool
    /// Some Error in `String` reason.
    public var reason: String
    /// Some Error in `String` error identifier.
    public var error: String?
    /// Some Error in `String` error status.
    public var status: String?
    /// Some Error in `String` error code.
    public var code: String?
    /// Some Error in `String` error uri.
    public var errorUri: String = "https://example.com/doc/errors"
    
    /// Initializes a `ErrorResponse` with the specified details.
    /// - Parameters:
    ///   - isError: Set to true, indicating the presence of an error.
    ///   - reason: A human-readable message describing the error.
    ///   - error: The unique identifier of the error.
    ///   - status: The HTTP status code as a string.
    ///   - code: A uniquely generated error code composed of the HTTP status code, provided number, and any additional error identifier.
    ///   - errorUri: Description of error in documentation
    public init(
        isError: Bool = true,
        reason: String,
        error: String? = nil,
        status: String? = nil,
        code: String? = nil,
        errorUri: String = "https://example.com/doc/errors"
    ) {
        self.isError = isError
        self.reason = reason
        self.error = error
        self.status = status
        self.code = code
        self.errorUri = errorUri
    }
}
