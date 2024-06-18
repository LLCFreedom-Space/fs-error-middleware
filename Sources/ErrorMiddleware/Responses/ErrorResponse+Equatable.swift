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
//  ErrorResponse+Equatable.swift
//
//
//  Created by Mykola Buhaiov on 18.06.2024.
//

import Vapor

/// Equatable protocol implementation for `ErrorResponse` struct.
///
/// Two `ErrorResponse` structs are considered equal if they have the same:
///
/// - isError
/// - reason
/// - error
/// - status
/// - status
/// - code
/// - errorUri
extension ErrorResponse: Equatable {
    /// Conform `ErrorResponse` to `Equatable` protocol
    /// - Parameters:
    ///   - lhs: `ErrorResponse`
    ///   - rhs: `ErrorResponse`
    /// - Returns: `Bool`
    public static func == (lhs: ErrorResponse, rhs: ErrorResponse) -> Bool {
        return lhs.isError == rhs.isError &&
        lhs.reason == rhs.reason &&
        lhs.error == rhs.error &&
        lhs.status == rhs.status &&
        lhs.code == rhs.code &&
        lhs.errorUri == rhs.errorUri
    }
}
