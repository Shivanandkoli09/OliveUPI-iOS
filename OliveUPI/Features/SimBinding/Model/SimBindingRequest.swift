//
//  SimBindingRequest.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 06/06/26.
//

import Foundation

struct SimBindingRequest: Codable {
    let mobileNumber: String
    let deviceId: String
}
