//
//  LocationCell.swift
//  DubDubGrub
//
//  Created by I9orila on 25.02.2023.
//

import SwiftUI

struct LocationCell: View {
   // @EnvironmentObject var viewModel: DDGLocationViewModel
    var dlocation: DDGLocation
    var body: some View {
        HStack(spacing: 5) {
            Image("default-square-asset")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .clipShape(Circle())
                .padding(.vertical, 15)
                
            
            
            VStack(alignment: .leading) {
                Text(dlocation.name)
                    
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                    .frame(width: 200)
                HStack {
                    AvatarView(size: 30)
                    AvatarView(size: 30)
                    AvatarView(size: 30)
                    AvatarView(size: 30)
                    AvatarView(size: 30)
                }
            }
            .padding(.leading,5)
        }
        
    }
}

//struct LocationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationCell(dlocation:)
//    }
//}
