//
//  DeviceVerificationService.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 07/06/26.
//

import Foundation

protocol DeviceVerificationServiceProtocol {

    func verifyDevice()
    async throws -> DeviceVerificationResponse
}

final class DeviceVerificationService: DeviceVerificationServiceProtocol {

    func verifyDevice() async throws -> DeviceVerificationResponse {

        try await Task.sleep(for: .seconds(2))

        return DeviceVerificationResponse(
            deviceId: UUID().uuidString,
            trustToken: UUID().uuidString,
            isVerified: true
        )
    }
}
