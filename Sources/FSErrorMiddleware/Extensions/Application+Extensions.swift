//
//  Application+Extensions.swift
//  
//
//  Created by Mykola Buhaiov on 25.03.2023.
//  Copyright © 2023 Freedom Space LLC
//  All rights reserved: http://opensource.org/licenses/MIT
//

import Vapor

extension Application {
    var globalEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.defaultDateFormat
        encoder.dateEncodingStrategy = .formatted(formatter)
        return encoder
    }
}
