//
//  ProfileImgView.swift
//  RandomUserList
//
//  Created by taese0ng on 2022/02/05.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImgView : View {
    var imageUrl:URL
    
    var body: some View {
        URLImage(imageUrl,
                 content: { image in
                    image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
        })
            .frame(width:60, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
    }
}

struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://randomuser.me/api/portraits/women/21.jpg")!
        
        ProfileImgView(imageUrl: url)
    }
}
