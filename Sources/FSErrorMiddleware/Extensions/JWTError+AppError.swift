//
//  JWTError+AppError.swift
//  
//
//  Created by Mykola Buhaiov on 15.09.2023.
//

import JWT
import Vapor

extension JWTError: AppError {
    public var identifier: String {
        switch self {
        case .claimVerificationFailure:
            return "claim_verification_failure"
        case .signingAlgorithmFailure:
            return "signing_algorithm_failure"
        case .malformedToken:
            return "malformed_token"
        case .signatureVerifictionFailed:
            return "signature_verifiction_failed"
        case .missingKIDHeader:
            return "missing_kid_header"
        case .unknownKID:
            return "unknown_kid"
        case .invalidJWK:
            return "invalid_jwk"
        case .invalidBool:
            return "invalid_bool"
        case .generic:
            return "generic"
        }
    }

    public var number: String {
        switch self {
        case .claimVerificationFailure:
            return "0001"
        case .signingAlgorithmFailure:
            return "0002"
        case .malformedToken:
            return "0003"
        case .signatureVerifictionFailed:
            return "0004"
        case .missingKIDHeader:
            return "0005"
        case .unknownKID:
            return "0006"
        case .invalidJWK:
            return "0007"
        case .invalidBool:
            return "0008"
        case .generic:
            return "0009"
        }
    }
}
