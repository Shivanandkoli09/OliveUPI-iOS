//
//  SimBindingView.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 05/06/26.
//

import SwiftUI


struct SimBindingView: View {

    @StateObject private var viewModel = SimBindingViewModel()
    @EnvironmentObject var onboardingSession: OnboardingSession

    @EnvironmentObject var appState: AppState

    var body: some View {

        NavigationStack {

            VStack(spacing: 24) {

                Spacer()

                Image(systemName: "simcard.fill")
                    .font(.system(size: 60))

                Text("SIM Binding")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Verify your mobile number registered with your bank")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                TextField(
                    "Enter Mobile Number",
                    text: $viewModel.mobileNumber
                )
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)

                if let error = viewModel.errorMessage {

                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                }

                Button {

                    Task {
                        await viewModel.verifySIM()

                        if viewModel.isVerified {

                            onboardingSession.mobileNumber =
                                viewModel.mobileNumber

                            appState.currentFlow = .deviceVerification
                        }
                    }

                } label: {

                    if viewModel.isLoading {

                        ProgressView()

                    } else {

                        Text("Verify SIM")
                            .frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
        }
    }
}
