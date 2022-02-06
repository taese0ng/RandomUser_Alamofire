//
//  UserDetailView.swift
//  RandomUserList
//
//  Created by taese0ng on 2022/02/06.
//

import Foundation
import SwiftUI
import URLImage

struct UserDetailView: View {
    var user: RandomUser
    
    var body: some View {
        let userImg:URL = URL(string: user.photo.large)!
        
        VStack{
            URLImage(userImg,
                     content: { image in
                        image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
            })
                .frame(width:200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
            
            Text("\(user.description)")
                .fontWeight(.medium)
                .font(.system(size: 25))
                .padding(.top, 40)
        }
        .navigationBarTitle("Detail", displayMode: .inline)
    }

}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: RandomUser.getDummy())
    }
}
