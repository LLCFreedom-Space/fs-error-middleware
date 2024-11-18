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
//  AppError+Extensions.swift
//
//
//  Created by Mykola Buhaiov on 14.06.2024.
//

import Vapor

/// A public extension of the `AppError` that provides an additional computed property for retrieving the error number.
public extension AppError {
    /// A string representation of the error number.
    /// This property is a placeholder that returns an empty string (`""`) by default.
    /// You can override this extension or use it to provide a custom implementation
    /// for error numbers in your `AppError` conforming types.
    var number: String {
        ""
    }
}
