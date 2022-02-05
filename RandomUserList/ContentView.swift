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
        List(randomUserViewModel.randomUsers){
            randomUser in
            RandomUserRowView(randomUser: randomUser)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
