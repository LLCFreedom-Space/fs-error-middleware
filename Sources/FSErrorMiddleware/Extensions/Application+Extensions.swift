//
//  Application+Extensions.swift
//  
//
//  Created by Mykola Buhaiov on 25.03.2023.
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
