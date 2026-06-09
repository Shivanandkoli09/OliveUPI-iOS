//
//  DeviceVerificationResponse.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 07/06/26.
//

import Foundation

struct DeviceVerificationResponse {

    let deviceId: String

    let trustToken: String

    let isVerified: Bool
}
