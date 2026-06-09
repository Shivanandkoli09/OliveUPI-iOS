//
//  CustomerHandshakeViewModel.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 09/06/26.
//

import Foundation
import Combine

@MainActor
final class CustomerHandshakeViewModel: ObservableObject {

    @Published var isLoading = false

    @Published var handshakeCompleted = false

    @Published var errorMessage: String?

    var response:
    CustomerHandshakeResponse?

    private let service:
    CustomerHandshakeServiceProtocol

    init(service:CustomerHandshakeServiceProtocol = CustomerHandshakeService()) {
        self.service = service
    }

    func performHandshake(request: CustomerHandshakeRequest) async {

        isLoading = true

        do {

            let result = try await service.performHandshake(request: request)

            response = result

            handshakeCompleted = true

            isLoading = false

        } catch {

            errorMessage =
            error.localizedDescription

            isLoading = false
        }
    }
}
