//
//  ContentView.swift
//  RandomUserList
//
//  Created by taese0ng on 2022/02/05.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        NavigationView{
            ZStack(alignment:.bottomTrailing){
                VStack(alignment: .center, spacing: 0) {
                    Text("RandomUser List")
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size:20))
                    
                    List(randomUserViewModel.randomUsers){
                        randomUser in
                        NavigationLink(
                            destination: UserDetailView(user: randomUser)
                        ) {
                            RandomUserRowView(randomUser: randomUser)
                        }
                    }.listStyle(PlainListStyle())
                }
            }.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
