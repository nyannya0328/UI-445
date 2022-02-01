//
//  Extencions.swift
//  UI-445
//
//  Created by nyannyan0328 on 2022/02/01.
//

import SwiftUI
import ReplayKit

extension View{
    
    func startRecoding(enableMicorPhone : Bool = false,competition : @escaping(Error?) -> ()){
        
        
        
        let recoder = RPScreenRecorder.shared()
        
        recoder.isMicrophoneEnabled = false
        
        recoder.startRecording(handler: competition)
        
    
    }
    
    
    func stopRecoding()async throws -> URL{
        
        
        
        let name = UUID().uuidString + " .mov"
        
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(name)
        
        let recoder = RPScreenRecorder.shared()
        
        
        try await recoder.stopRecording(withOutput: url)
        
        return url
    }
    
    
    func chancelRecoding(){
        
        
        
        let recoder = RPScreenRecorder.shared()
        
        recoder.discardRecording {
            
        }
    }
    
    
    func shareSheet(show : Binding<Bool>,items : [Any?])->some View{
        
        
        return self
        
            .sheet(isPresented: show) {
                
                
            } content: {
                
                
                let items = items.compactMap { item -> Any? in
                    
                    return item
                }
                
                if !items.isEmpty{
                    
                    
                    
                    ShareSheet(items: items)
                }
                
                
            }

        
        
        
        
    }
    
    
    func stopRecodingWidthEdit(){
        
        
        let recoder = RPScreenRecorder.shared()
        
        let delegete = ReplayDelgete()
        
        
        recoder.stopRecording { controller, err in
            
            if let controller = controller{
                
                controller.modalPresentationStyle = .fullScreen
                controller.previewControllerDelegate = delegete
                DispatchQueue.main.async {
                    
                    rootController().present(controller, animated: true)
                    
                    
                    
                }
                
                
            }
            
        }
        
        
        
        
        
        
        
        
    }
    
    func rootController()->UIViewController{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            
            return .init()
        }
        
        guard let rootView = screen.windows.first?.rootViewController else{
            
            return .init()
        }
        
        return rootView
        
        
        
    }
    
    
   
    
    
    
    
}

class ReplayDelgete : NSObject,RPPreviewViewControllerDelegate{
    
    
    
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        
        previewController.dismiss(animated: true)
    }
    
    
    
}

