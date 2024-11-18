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

/// A model representing a standardized error response.
/// This struct conforms to `Content`, making it suitable for encoding and decoding in Vapor applications.
/// It provides detailed information about an error, including its status, code, and a URI for further documentation.
public struct ErrorResponse: Content {
    /// Indicates whether the response represents an error.
    /// A `true` value signifies that an error occurred, while `false` may indicate a successful response.
    public var isError: Bool
    /// A human-readable description of the error.
    /// This field typically contains a brief explanation of why the error occurred.
    public var reason: String
    /// An optional identifier for the error.
    /// This can be used to reference a specific error type or category for debugging or logging purposes.
    public var error: String?
    /// An optional status representing the error state.
    /// This field may contain a status code, textual representation, or other status-related information.
    public var status: String?
    /// An optional code representing the error.
    /// This is often used to categorize errors into distinct types or classes, typically defined by the API.
    public var code: String?
    /// A URI providing further documentation about the error.
    /// By default, this is set to `https://example.com/doc/errors`, which should be updated to point to
    /// the appropriate documentation resource in your application.
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
