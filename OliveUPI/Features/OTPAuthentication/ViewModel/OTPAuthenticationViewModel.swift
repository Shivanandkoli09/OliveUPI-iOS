//
//  OTPAuthenticationViewModel.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 07/06/26.
//

import Foundation
import Combine

@MainActor
final class OTPAuthenticationViewModel: ObservableObject {

    @Published var otp = ""

    @Published var isLoading = false

    @Published var requestId = ""

    @Published var errorMessage: String?

    @Published var isOTPVerified = false

    private let service: OTPServiceProtocol

    init(service: OTPServiceProtocol = OTPService()) {
        self.service = service
    }

    func generateOTP(
        mobileNumber: String,
        deviceId: String
    ) async {

        isLoading = true

        do {

            let response =
            try await service.generateOTP(
                request: GenerateOTPRequest(
                    mobileNumber: mobileNumber,
                    deviceId: deviceId
                )
            )

            requestId = response.requestId

            isLoading = false

        } catch {

            errorMessage = error.localizedDescription

            isLoading = false
        }
    }

    func validateOTP() async {

        isLoading = true

        do {

            let response =
            try await service.validateOTP(
                otp: otp
            )

            isOTPVerified = response.isValid

            isLoading = false

        } catch {

            errorMessage = error.localizedDescription

            isLoading = false
        }
    }
}
