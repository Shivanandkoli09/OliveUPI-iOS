//
//  CustomerHandshakeService.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 09/06/26.
//

import Foundation

protocol CustomerHandshakeServiceProtocol {

    func performHandshake(request: CustomerHandshakeRequest) async throws -> CustomerHandshakeResponse
}

final class CustomerHandshakeService:CustomerHandshakeServiceProtocol {

    func performHandshake(request: CustomerHandshakeRequest) async throws -> CustomerHandshakeResponse {

        AppLogger.request(
            endpoint: "/customer/handshake",
            payload:
"""
{
  "customerId": "\(request.customerId)",
  "deviceId": "\(request.deviceId)",
  "trustToken": "\(request.trustToken)"
}
"""
        )

        try await Task.sleep(for: .seconds(2))

        let response = CustomerHandshakeResponse(sessionToken: UUID().uuidString,upiEnabled: true,customerStatus: "ACTIVE")

        AppLogger.response(
            endpoint: "/customer/handshake",
            payload:
"""
{
  "sessionToken": "\(response.sessionToken)",
  "upiEnabled": \(response.upiEnabled),
  "customerStatus": "\(response.customerStatus)"
}
"""
        )

        return response
    }
}
