//
//  DeviceVerificationViewModel.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 07/06/26.
//

import Foundation
import Combine

@MainActor
final class DeviceVerificationViewModel: ObservableObject {

    @Published var isLoading = false

    @Published var errorMessage: String?

    @Published var verificationResponse: DeviceVerificationResponse?

    private let service: DeviceVerificationServiceProtocol

    init(service: DeviceVerificationServiceProtocol = DeviceVerificationService() ) {
        self.service = service
    }

    func verifyDevice() async {

        isLoading = true

        errorMessage = nil

        do {

            let response = try await service.verifyDevice()

            verificationResponse = response

            isLoading = false

        } catch {

            errorMessage = error.localizedDescription

            isLoading = false
        }
    }
}
