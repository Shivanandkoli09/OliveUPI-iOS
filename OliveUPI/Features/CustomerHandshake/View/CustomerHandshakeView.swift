//
//  CustomerHandshakeView.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 05/06/26.
//

import SwiftUI

struct CustomerHandshakeView: View {

    @StateObject private var viewModel = CustomerHandshakeViewModel()

    @EnvironmentObject var appState: AppState

    @EnvironmentObject var onboardingSession: OnboardingSession

    var body: some View {

        VStack(spacing: 24) {

            Spacer()

            Image(systemName: "person.badge.shield.checkmark")
                .font(.system(size: 60))

            Text("Customer Handshake")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(
                "Establishing secure banking session"
            )
            .multilineTextAlignment(.center)

            Button {

                Task {

                    await performHandshake()
                }

            } label: {

                if viewModel.isLoading {

                    ProgressView()

                } else {

                    Text("Start Handshake")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }

    private func performHandshake() async {

        let request = CustomerHandshakeRequest(customerId:onboardingSession.customerId,deviceId:onboardingSession.deviceId,trustToken:onboardingSession.trustToken)

        await viewModel.performHandshake(
            request: request
        )

        guard let response =
            viewModel.response else {
            return
        }

        onboardingSession.sessionToken =
            response.sessionToken

        onboardingSession.customerStatus =
            response.customerStatus

        AppLogger.session(
            message:
"""
Customer ID:
\(onboardingSession.customerId)

Session Token:
\(response.sessionToken)

Status:
\(response.customerStatus)
"""
        )

        AppLogger.navigation(
            from: "CustomerHandshake",
            to: "BankDiscovery"
        )

        appState.currentFlow = .bankDiscovery
    }
}
