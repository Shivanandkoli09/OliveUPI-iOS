//
//  OTPAuthenticationView.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 05/06/26.
//

import SwiftUI

struct OTPAuthenticationView: View {

    @StateObject private var viewModel = OTPAuthenticationViewModel()

    @EnvironmentObject var appState: AppState

    @EnvironmentObject var onboardingSession: OnboardingSession

    var body: some View {

        VStack(spacing: 20) {

            Spacer()

            Image(systemName: "lock.shield")
                .font(.system(size: 60))

            Text("OTP Authentication")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(
                onboardingSession.mobileNumber
            )

            TextField("Enter OTP",text: $viewModel.otp)
             .keyboardType(.numberPad)
             .textFieldStyle(.roundedBorder)

            Button {

                Task {

                    await viewModel.validateOTP()

                    if viewModel.isOTPVerified {

                        onboardingSession.customerId = "CUST_10001"

                        AppLogger.log(category: "SESSION UPDATE",message:"Customer Id Saved:\(onboardingSession.customerId)")

                        appState.currentFlow = .customerHandshake
                    }
                }

            } label: {

                if viewModel.isLoading {

                    ProgressView()

                } else {

                    Text("Verify OTP")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)

            if let error =
                viewModel.errorMessage {

                Text(error)
                    .foregroundColor(.red)
            }

            Spacer()
        }
        .padding()
        .task {

            await viewModel.generateOTP(
                mobileNumber:
                    onboardingSession.mobileNumber,
                deviceId:
                    onboardingSession.deviceId
            )
        }
    }
}
