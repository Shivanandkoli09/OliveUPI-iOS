//
//  CustomerHandshakeResponse.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 09/06/26.
//

import Foundation

struct CustomerHandshakeResponse {

    let sessionToken: String

    let upiEnabled: Bool

    let customerStatus: String
}
