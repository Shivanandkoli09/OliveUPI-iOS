//
//  DeviceVerificationView.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 05/06/26.
//

import SwiftUI

struct DeviceVerificationView: View {
    
    @StateObject private var viewModel = DeviceVerificationViewModel()
    
    @EnvironmentObject var appState: AppState
    
    @EnvironmentObject var onboardingSession: OnboardingSession
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            Spacer()
            
            Image(systemName: "iphone.gen3")
                .font(.system(size: 60))
            
            Text("Device Verification")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(
                "Verify this device before OTP authentication"
            )
            .multilineTextAlignment(.center)
            
            Button {
                
                Task {
                    
                    await viewModel.verifyDevice()
                    
                    if let response = viewModel.verificationResponse {
                        
                        onboardingSession.deviceId = response.deviceId
                        
                        onboardingSession.trustToken = response.trustToken
                        
                        appState.currentFlow = .otpAuthentication
                    }
                }
                
            } label: {
                
                if viewModel.isLoading {
                    
                    ProgressView()
                    
                } else {
                    
                    Text("Verify Device")
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
    }
}
