//
//  RootView.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 05/06/26.
//

import SwiftUI

struct RootView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {

        switch appState.currentFlow {

        case .simBinding:
            SimBindingView()

        case .deviceVerification:
            DeviceVerificationView()

        case .otpAuthentication:
            OTPAuthenticationView()

        case .customerHandshake:
            CustomerHandshakeView()

        case .bankDiscovery:
            BankDiscoveryView()

        case .bankLinking:
            BankLinkingView()

        case .upiPinSetup:
            UPIPINSetupView()

        case .registrationComplete:
            RegistrationCompleteView()
        }
    }
}
