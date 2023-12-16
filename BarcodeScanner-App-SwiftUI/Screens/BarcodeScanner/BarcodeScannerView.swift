//
//  BarcodeScannerView.swift
//  BarcodeScanner-App-SwiftUI
//
//  Created by Furkan Bingöl on 16.12.2023.
//

import SwiftUI

#Preview {
    BarcodeScannerView()
}

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, 
                            alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 320)   // .infinity = fill screen
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title), dismissButton: alertItem.dismissButton)
            }
        }
    }
}
