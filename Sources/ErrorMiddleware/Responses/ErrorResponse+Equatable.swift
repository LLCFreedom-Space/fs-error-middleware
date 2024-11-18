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

/// Extends `ErrorResponse` to conform to the `Equatable` protocol.
extension ErrorResponse: Equatable {
    /// Determines whether two `ErrorResponse` instances are equal.
    /// This implementation compares all properties of `ErrorResponse` to check for equality.
    /// - Parameters:
    ///   - lhs: The left-hand side `ErrorResponse` instance.
    ///   - rhs: The right-hand side `ErrorResponse` instance.
    /// - Returns: A `Bool` value indicating whether the two instances are equal.
    public static func == (lhs: ErrorResponse, rhs: ErrorResponse) -> Bool {
        return lhs.isError == rhs.isError &&
        lhs.reason == rhs.reason &&
        lhs.error == rhs.error &&
        lhs.status == rhs.status &&
        lhs.code == rhs.code &&
        lhs.errorUri == rhs.errorUri
    }
}
