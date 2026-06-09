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

    static func request(endpoint: String,payload: String) {

        print("""

        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        🚀 REQUEST
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        Endpoint: \(endpoint)

        Payload:
        \(payload)
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        """)
    }

    static func response(endpoint: String,payload: String) {

        print("""

        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        ✅ RESPONSE
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        Endpoint: \(endpoint)

        Payload:
        \(payload)
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        """)
    }

    static func session(message: String) {

        print("""

        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        🔐 SESSION
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        \(message)
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        """)
    }

    static func navigation(from: String,to: String) {

        print("""

        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        🧭 NAVIGATION
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        \(from)
        →
        \(to)
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        """)
    }

    static func error(message: String) {

        print("""

        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        ❌ ERROR
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        \(message)
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        """)
    }
}
