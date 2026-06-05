//
//  AppState.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 05/06/26.
//

import Foundation
import Combine

final class AppState: ObservableObject {

    @Published var currentFlow: AppFlow = .simBinding
}
