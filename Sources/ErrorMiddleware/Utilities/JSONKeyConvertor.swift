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
//  JSONKeyConvertor.swift
//  fs-error-middleware
//
//  Created by Mykola Buhaiov on 18.11.2024.
//

import Vapor

/// A utility for configuring a `JSONEncoder` with a specified key encoding strategy.
///
/// This struct provides functionality to create a `JSONEncoder` configured for a particular key encoding strategy,
/// making it easier to handle different JSON key formats, such as converting field names to snake_case.
struct JSONKeyConvertor {
    /// Creates a `JSONEncoder` configured with the specified key encoding strategy.
    ///
    /// This method initializes a new `JSONEncoder` and applies the given key encoding strategy to it.
    ///
    /// - Parameter key: The desired `JSONEncoder.KeyEncodingStrategy` to use for encoding keys.
    /// - Returns: A `JSONEncoder` instance configured with the specified key encoding strategy.
    func convert(to key: JSONEncoder.KeyEncodingStrategy) -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = key
        return encoder
    }
}
