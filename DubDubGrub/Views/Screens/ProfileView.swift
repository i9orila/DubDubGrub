//
//  ProfileView.swift
//  DubDubGrub
//
//  Created by I9orila on 24.02.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @State var presentingConfirmationDialog = false
    @State private var firstName    = ""
    @State private var lastName     = ""
    @State private var companyName  = ""
    @State private var bio          = ""
    @State  var image: UIImage?
    @State private var showSheet = false
    
    private func deleteAccount() {
      Task {
        if await viewModel.deleteAccount() == true {
          dismiss()
        }
      }
    }

    private func signOut() {
      viewModel.signOut()
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                NameBackgroundView()
                
                HStack(spacing: 20) {
                    ZStack {
                        Button {
                            showSheet.toggle()
                            
                        } label: {
                           
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame( width: 110 ,height: 110)
                                        .clipShape(Circle())
                                    
                                    
                                } else {
                                    AvatarView(size: 110)
                                    EditImage()
                                }
                                
                                
                            
                            
                        }
                        
                        }
                    
                    
                    
                   .padding(.leading, 8)
                   
                    .sheet(isPresented: $showSheet) {
                        // Pick an image from the photo library:
                        ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
                        
                        //  If you wish to take a photo from camera instead:
                        //ImagePicker(sourceType: .camera, selectedImage: self.$image)
                    }
                    
                    VStack(alignment:.leading) {
                        TextField("First Name", text: $firstName)
                            .font(.title)
                            .fontWeight(.semibold)
                        TextField("Last Name", text: $lastName)
                            .font(.title2)
                            .fontWeight(.semibold)
                        TextField("Company Name", text: $companyName)
                        
                            
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                    .padding(.trailing, 16)
                }
                
            }
            
            HStack {
                Text("You're logged in as \(viewModel.displayName).")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                    //.padding(.leading)
                
                Spacer()
            }
            .padding(.top, 5)
            
            HStack {
                CharactersRemaininView(currentCount: bio.count)
                
                Spacer()
                Button {
                    
                } label: {
                    Label("Chek Out", systemImage: "mappin.and.ellipse")
                }
                .fontWeight(.semibold)
                .buttonStyle(.bordered)
                .tint(.brandSecondary)
            }
            .padding(.vertical)
            
            
            TextEditor(text: $bio)
                .frame(height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary, lineWidth:1))
            
            Spacer()
            
            SaveButton()
            
        }
        
        .navigationTitle("Profile")
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
       Group {
            ProfileView(image: UIImage(named: "default-avatar"))
            ProfileView(image: UIImage(named: "default-avatar"))
                .preferredColorScheme(.dark)
        }.environmentObject(AuthenticationViewModel())
    }
}

struct NameBackgroundView: View {
    var body: some View {
        Color(.secondarySystemBackground)
            .frame(height: 130)
            .cornerRadius(12)
    }
}

struct EditImage: View {
    var body: some View {
        Image(systemName: "square.and.pencil")
            .resizable()
            .scaledToFit()
            .frame(width: 14)
            .foregroundColor(.white)
            .offset(x: -33, y: -10)
    }
}


struct CharactersRemaininView: View {
    var currentCount: Int
    var body: some View {
        Text("Bio: ")
            .font(.caption)
            .foregroundColor(.secondary)
        +
        Text("\(100 - currentCount)")
            .bold()
            .font(.caption)
            .foregroundColor(currentCount <= 100 ? .brandPrimary : .brandSecondary)
        +
        Text(" Characters Remain")
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

struct SaveButton: View {
    var body: some View {
        Button("Save Profile") { }
            .fontWeight(.semibold)
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.brandSecondary)
            .padding(.vertical)
    }
}
