//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner-App-SwiftUI
//
//  Created by Furkan Bingöl on 16.12.2023.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    // Computed Properties
    var statusText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return scannedCode.isEmpty ? .red : .green
    }
}
