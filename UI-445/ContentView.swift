//
//  ContentView.swift
//  UI-445
//
//  Created by nyannyan0328 on 2022/02/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var isRecoding : Bool = false
    
    @State var url : URL?
    
    @State var showSeet : Bool = false
    
    var body: some View {
       
            
        Text("Home")
                .font(.largeTitle.bold())
                .frame(maxWidth:.infinity,maxHeight: .infinity)
        
        .overlay(alignment:.bottomTrailing){
                
                Button {
                    if isRecoding{
                        
                        
                        Task{
                            
                            
                            do{
                                
                                self.url = try await stopRecoding()
                                
                                isRecoding = false
                                
                                
                            
                                
                                
                            }
                            
                            catch{
                                
                                print(error.localizedDescription)
                            }
                        }
                        
                        
                    }
                    else{
                        
                        
                        startRecoding { error in
                            if let error = error{
                                
                                print(error.localizedDescription)
                                
                                
                            }
                            
                            isRecoding = true
                        }
                    }
                    
                } label: {
                    
                    Image(systemName:isRecoding ?  "record.circle.fill" : "record.circle")
                        .font(.largeTitle)
                        .foregroundColor(isRecoding ? .red : .black)
                        .padding()
                        
                    
                    
                
                }
            

                
                
            }
        .shareSheet(show:$showSeet , items: [url])
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
