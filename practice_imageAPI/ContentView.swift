//
//  ContentView.swift
//  practice_imageAPI
//
//  https://62bbeeb36b1401736cecefcf.mockapi.io/user
//

import SwiftUI

struct ContentView: View {
    
    @State private var allUser = [User]()
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())], content: {
                
                ForEach(allUser){ user in
                    
                    HStack(){
                        URLImage(urlString: user.avatar)
                            .frame(width: 100, height: 100)
                        Text(user.name)
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
            }).onAppear {
                network().getJSON { allUser in
                    self.allUser = allUser
                    print("onAppear: \(allUser)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
