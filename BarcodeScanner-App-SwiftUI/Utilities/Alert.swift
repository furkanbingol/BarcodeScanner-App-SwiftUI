//
//  Alert.swift
//  BarcodeScanner-App-SwiftUI
//
//  Created by Furkan Bingöl on 16.12.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              dismissButton: .default(Text("OK")))
    static let invalidScannedType = AlertItem(title: "Invalid Scan Type",
                                              dismissButton: .default(Text("OK")))
}
