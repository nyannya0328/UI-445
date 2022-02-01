//
//  ShareSheet.swift
//  UI-445
//
//  Created by nyannyan0328 on 2022/02/01.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    
    var items : [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let actv = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return actv
        
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
        
    }
}
