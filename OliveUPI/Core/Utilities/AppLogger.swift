//
//  AppLogger.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 07/06/26.
//

import Foundation

enum AppLogger {

    static func log( category: String, message: String) {

        print(" [\(category)] \(message)")
    }
}
