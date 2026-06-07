//
//  OTPService.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 07/06/26.
//

import Foundation

protocol OTPServiceProtocol {

    func generateOTP(request: GenerateOTPRequest) async throws -> GenerateOTPResponse

    func validateOTP(otp: String) async throws -> ValidateOTPResponse
}

final class OTPService: OTPServiceProtocol {

    func generateOTP(request: GenerateOTPRequest) async throws -> GenerateOTPResponse {

        AppLogger.log(category: "OTP REQUEST",message:"Mobile Number: \(request.mobileNumber) Device Id: \(request.deviceId)" )

        try await Task.sleep(for: .seconds(2))

        let response = GenerateOTPResponse(
            requestId: UUID().uuidString,
            message: "OTP Sent Successfully"
        )

        AppLogger.log(category: "OTP RESPONSE",message:"Request Id: \(response.requestId) Message: \(response.message)")

        return response
    }

    func validateOTP(otp: String) async throws -> ValidateOTPResponse {

        AppLogger.log(
            category: "OTP VALIDATION REQUEST",
            message: "Entered OTP: \(otp)")

        try await Task.sleep(for: .seconds(2))

        let response = ValidateOTPResponse(
            customerId: "CUST_10001",
            isValid: otp == "123456"
        )

        AppLogger.log(
            category: "OTP VALIDATION RESPONSE",
            message:"Customer Id: \(response.customerId) Valid: \(response.isValid)")

        return response
    }
}
