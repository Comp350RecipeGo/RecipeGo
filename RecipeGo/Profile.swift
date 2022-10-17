//
//  Profile.swift
//  RecipeGo
//
//  Created by Amanda Dawley on 10/15/22.
//


import SwiftUI

struct Profile: View {
    let profileLinkNames: [String] = ["Pinned Posts", "Followers", "Following"]
    
    var body: some View {
        NavigationView{
            VStack(spacing:0) {
            ForEach(profileLinkNames, id: \.self) { profileLinkName in
                ProfileLink(profileLinkName: profileLinkName)
            }
            Spacer()
        }
            .navigationBarTitle("John Doe")
            .navigationBarItems(
            leading:
            Text("Premium Member")
                .font(.body)
                .foregroundColor(Color(.systemGray)),
                trailing:
                Image("avatar")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())) 
    
    }
}

}
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ProfileLink: View {
    let profileLinkName: String
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Text(profileLinkName)
                    .font(.body)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(.systemBlue))
                    .font(.system(size:25))
            }
            .padding(EdgeInsets(top: 17, leading: 21, bottom: 17, trailing: 21))
            Divider()
        }
    }
}
