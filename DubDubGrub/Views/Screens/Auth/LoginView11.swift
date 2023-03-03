//
//  LoginView.swift
//  DubDubGrub
//
//  Created by I9orila on 26.02.2023.
////

import SwiftUI
import Firebase

struct LoginView11: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.black
              RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(LinearGradient(colors: [.brandSecondary, .brandPrimary], startPoint: .topTrailing, endPoint: .bottom))
                //.shadow(radius: 110)
                .frame(width: 1000, height: 450)
                .rotationEffect(.degrees(125))
                .offset(x:-110, y: -300)


            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.primary)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(x:-100, y: -100)

                TextField("Email", text: $email)
                    .foregroundColor(.secondary)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.secondary)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)

                SecureField("Password", text: $password )
                    .foregroundColor(.secondary)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.secondary)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)

                Button {
                    register()
                } label: {
                    Text("Sign up")
                }
                .buttonStyle(.bordered)
                .tint(.brandSecondary)
                .controlSize(.large)
                .bold()
                .padding(.top)
                .offset(y:100)


                Button {
                    signInWithEmailPassword()
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y:110)
            }
            .frame(width: 350)
            }
        .ignoresSafeArea()
    }

    private func signInWithEmailPassword() {
      Task {
        if await viewModel.signInWithEmailPassword() == true {
          dismiss()
        }
      }
    }

    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }

}

struct LoginView11_Previews: PreviewProvider {
    static var previews: some View {
        LoginView11()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
