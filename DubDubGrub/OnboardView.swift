//
//  OnboardView.swift
//  DubDubGrub
//
//  Created by I9orila on 03.03.2023.
//

import SwiftUI
import Combine
import FirebaseAnalytics
import AuthenticationServices

struct OnboardView: View {
    @Binding var isShowingOnboardView: Bool
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                   isShowingOnboardView = false
                } label: {
                    XDismisButton()
                }
            }
            Spacer()
           LogoView(frameWidth: 250)
                .padding(30)
            
            VStack(alignment: .leading) {
                OnboardInfoView(image: "building.2.crop.circle",
                                title: "Restauran Locations",
                                desc: "Find places to dine around the convention center")
                OnboardInfoView(image: "checkmark.circle",
                                title: "Chek In",
                                desc: "Let other iOS Devs know where you are")
                OnboardInfoView(image: "person.2.circle",
                                title: "Find Friends",
                                desc: "See where other iOS Devs are and join the party")
            }
                        Spacer()
            
            
            .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
            .frame(maxWidth: 220, maxHeight: 40)
            .cornerRadius(8)
            
            
        }
        .padding()

    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardView(isShowingOnboardView: .constant(true))
            OnboardView(isShowingOnboardView: .constant(true))
                .preferredColorScheme(.dark)
        }
        .environmentObject(AuthenticationViewModel())
    }
}

struct OnboardInfoView: View {
    var image: String
    var title: String
    var desc: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(.brandPrimary)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                    .bold()
                Text(desc)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.75)
                
                
            }
        }
        .padding(10)
    }
}
