//
//  ContentView.swift
//  HackerNews
//
//  Created by Barış Yeşilkaya on 6.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = Networkmanager()
    
    var body: some View {
        
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("HackerNews")
        }
        
        .onAppear {
            self.networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
