//
//  XDismisButton.swift
//  DubDubGrub
//
//  Created by I9orila on 03.03.2023.
//

import SwiftUI

struct XDismisButton: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 30, height: 30)
                .foregroundColor(.brandPrimary)
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .imageScale(.small)
                .frame(width: 44,height: 44)
        }
    }
}

struct XDismisButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismisButton()
    }
}
