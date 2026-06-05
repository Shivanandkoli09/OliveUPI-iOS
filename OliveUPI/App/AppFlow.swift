//
//  AppFlow.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 05/06/26.
//

import Foundation

enum AppFlow {
    case simBinding
    case deviceVerification
    case otpAuthentication
    case customerHandshake
    case bankDiscovery
    case bankLinking
    case upiPinSetup
    case registrationComplete
}
