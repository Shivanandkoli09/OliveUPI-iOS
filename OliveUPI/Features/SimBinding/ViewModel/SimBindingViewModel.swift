//
//  SimBindingViewModel.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 06/06/26.
//

import Foundation
import Combine
import UIKit

@MainActor
final class SimBindingViewModel: ObservableObject {

    @Published var mobileNumber = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isVerified = false

    private let service: SimBindingServiceProtocol

    init(service: SimBindingServiceProtocol = SimBindingService()) {
        self.service = service
    }

    func verifySIM() async {

        errorMessage = nil
        isLoading = true

        let request = SimBindingRequest(
            mobileNumber: mobileNumber,
            deviceId: deviceIdentifier
        )

        do {

            let success = try await service.verifySIM(
                request: request
            )

            isLoading = false

            if success {
                isVerified = true
            } else {
                errorMessage = "Invalid mobile number"
            }

        } catch {

            isLoading = false
            errorMessage = error.localizedDescription
        }
    }

    private var deviceIdentifier: String {

        UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
    }
}
