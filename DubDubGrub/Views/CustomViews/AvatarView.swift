//
//  AvatarView.swift
//  DubDubGrub
//
//  Created by I9orila on 25.02.2023.
//

import SwiftUI

struct AvatarView: View {
    var size: CGFloat
    var body: some View {
        Image("default-avatar")
            .resizable()
            .scaledToFit()
            .frame( width: size ,height: size)
            .clipShape(Circle())
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(size: 90)
    }
}
