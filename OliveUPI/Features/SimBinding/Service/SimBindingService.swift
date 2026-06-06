//
//  SimBindingService.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 06/06/26.
//

import Foundation

protocol SimBindingServiceProtocol {
    func verifySIM(request: SimBindingRequest) async throws -> Bool
}

final class SimBindingService: SimBindingServiceProtocol {

    func verifySIM(request: SimBindingRequest) async throws -> Bool {

        try await Task.sleep(for: .seconds(2))

        guard request.mobileNumber.count == 10 else {
            return false
        }

        return true
    }
}
