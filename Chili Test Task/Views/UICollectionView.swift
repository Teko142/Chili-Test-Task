//
//  HomeView.swift
//  Chili Test Task
//
//  Created by Артур Олехно on 14/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct UICollectionView: View {
    @State public var isLoading = true
    // Gif data
    @State var gifData : [String] = []
    // Gif Controller
    @State var present = false
    @State var url = ""
    var body: some View {
        
        if !isLoading {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ForEach(gifData, id: \.self) { url in
                    
                    HStack {
                        Spacer(minLength: 0)
                        // Animated Image will download GIF
                        AnimatedImage(url: URL(string: url)!)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(CustomShape())                        
                    }
                    .padding()
                }
                .onChange(of: url) { value in
                    self.gifData.append(value)
                }
                .navigationTitle("GIF's")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button(action: {present.toggle()}) {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                            .font(.title
                            )
                    }
                }
                
            }
            .fullScreenCover(isPresented: $present, content: {
                GIFController(url: $url, present: $present)
            })
            
        } else if isLoading {
            ZStack {
                
                Color(.systemBackground)
                    .ignoresSafeArea()
                    .opacity(0.8)
                    .onAppear{startFakeNetworkCall()}

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(3)
            }
        }
        
    }
    
    public func startFakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        UICollectionView()
    }
}
