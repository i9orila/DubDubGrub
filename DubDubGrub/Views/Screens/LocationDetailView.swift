//
//  LocationDetailView.swift
//  DubDubGrub
//
//  Created by I9orila on 24.02.2023.
//

import SwiftUI

struct LocationDetailView: View {
    var location: DDGPlaces
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   //GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
            VStack {
                ImageNameView(imageName: "default-banner-asset")
                    
                    
                
                HStack {
                    AdressView(adress: location.adress)
                    Spacer()
                    }
                .padding(.horizontal)
                
                DescriptionView(text: location.description)
                
                ZStack {
                    Capsule()
                        .frame(height: 80)
                        .foregroundColor(Color(.secondarySystemBackground))
                    HStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            LocationActionButton(imageName: "location.fill", color: .brandPrimary)
                        }
                    
                        Link(destination: URL(string: location.websiteURL)!, label: {
                            LocationActionButton(imageName: "network", color: .brandPrimary)
                        })
                        
                        Button {
                            
                        } label: {
                            LocationActionButton(imageName: "phone.fill", color: .brandPrimary)
                        }
                        
                        Button {
                            
                        } label: {
                            LocationActionButton(imageName: "person.crop.circle.badge.checkmark", color: .brandSecondary)
                        }
                    }
                }
                .padding(.horizontal)
                
                Text("Who's Where?")
                    .bold()
                    .font(.title2)
                
                ScrollView {
                    LazyVGrid(columns: columns , content: {
                        FirstVameAvatarView(firstName: "Igor")
                        FirstVameAvatarView(firstName: "Maga Djan")
                        FirstVameAvatarView(firstName: "Igor")
                        FirstVameAvatarView(firstName: "Ibragim")
                        FirstVameAvatarView(firstName: "Igor")
                        FirstVameAvatarView(firstName: "Petr")
                        FirstVameAvatarView(firstName: "Sandraaa")
                        FirstVameAvatarView(firstName: "Kris")
                        
                        
                    })
                }
                
                Spacer()
            }
            .ignoresSafeArea()
            .navigationTitle(location.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Dismiss") { }
                }
            }
        }
    }







struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
         //   LocationDetailView(Moc)
            //    .preferredColorScheme(.light)
        }
    }
}



struct LocationActionButton: View {
    var imageName: String
    var color: Color
    
    var body: some View {
            ZStack{
                Circle()
                    .frame(width: 60,height: 60)
                    .foregroundColor(color)
                    //.opacity(0.6)
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .foregroundColor(.white)
            }
        }
    }

struct FirstVameAvatarView: View {
    var firstName: String
    var body: some View {
        VStack {
            AvatarView(size: 64)
            
            Text(firstName)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
    }
}


struct ImageNameView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .opacity(0.8)
    }
}

struct AdressView: View {
    var adress: String
    var body: some View {
        Label(adress, systemImage: "mappin.and.ellipse")
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

struct DescriptionView: View {
    var text: String
    var body: some View {
        Text(text)
            .lineLimit(3)
            .minimumScaleFactor(0.8)
            .frame(height: 70)
            .padding(.horizontal)
    }
}
