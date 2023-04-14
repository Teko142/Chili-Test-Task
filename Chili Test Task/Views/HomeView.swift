//
//  HomeView.swift
//  Chili Test Task
//
//  Created by Артур Олехно on 14/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @State var gifData : [String] = []
    @State var present = false
    @State var url = ""
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            ForEach(gifData, id: \.self) { url in
                
                HStack {
                    Spacer(minLength: 0)
                    
                    AnimatedImage(url: URL(string: url)!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 100, height: 200)
                        .cornerRadius(15)
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
