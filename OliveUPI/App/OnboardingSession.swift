//
//  OnboardingSession.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 07/06/26.
//

import Foundation
import Combine

final class OnboardingSession: ObservableObject {

    @Published var mobileNumber: String = ""

    @Published var deviceId: String = ""

    @Published var trustToken: String = ""

    @Published var customerId: String = ""

    @Published var selectedBank: String = ""

    @Published var accountNumber: String = ""

    @Published var upiId: String = ""
}
