//
//  GIFController.swift
//  Chili Test Task
//
//  Created by Артур Олехно on 14/04/2023.
//

import SwiftUI
import GiphyUISDK

struct GIFController : UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return GIFController.Coordinator(parent: self)
    }
    
    @Binding var url : String
    @Binding var present : Bool
    
    func makeUIViewController(context: Context) -> GiphyViewController {
        Giphy.configure(apiKey: "4Vb0sQlasZ6ZDE4MlrQkv6G92vWF7Mkh")
        let controller = GiphyViewController()
        controller.mediaTypeConfig = [.emoji,.gifs,.stickers]
        controller.delegate = context.coordinator
        // Full Screen
        GiphyViewController.trayHeightMultiplier = 1.05
        return controller
    }
    
    func updateUIViewController(_ uiViewController: GiphyViewController, context: Context) {
        
    }
    
    class Coordinator : NSObject, GiphyDelegate {
        
        var parent : GIFController
        
        init(parent: GIFController){
            self.parent = parent
        }
        
        func didDismiss(controller: GiphyViewController?) {
            
        }
        
        func didSelectMedia(giphyViewController: GiphyViewController, media: GPHMedia) {
            // Retreving url
            let url = media.url(rendition: .fixedWidth, fileType: .gif)
            parent.url = url ?? ""
            parent.present.toggle()
        }
    }
}
