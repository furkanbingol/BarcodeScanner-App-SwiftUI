//
//  ScannerView.swift
//  BarcodeScanner-App-SwiftUI
//
//  Created by Furkan Bingöl on 16.12.2023.
//

import SwiftUI

//#Preview {
//    ScannerView(scannedCode: .constant("123"), alertItem: .constant(AlertItem(title: "",
//                                                                              dismissButton: .cancel())))
//}

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
        
    // typealias Context = UIViewControllerRepresentableContext<Self> , Self: ScannerView
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    
    // UIKit ViewController -> Coordinator (Middle Person) -> SwiftUI View
    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
    
}
