//
//  UserDetailView.swift
//  practice_imageAPI
//
//  Created by 김민령 on 2022/07/04.
//

import Foundation
import SwiftUI

struct UserDetailView : View {
    
    var user: User
    
    var body: some View {
    
        Text(user.name)
            .font(.title)
            .bold()
        URLImage(urlString: user.avatar)
            .aspectRatio(contentMode: .fit)
            .padding()
        Text(user.createdAt)
        
    }
}
