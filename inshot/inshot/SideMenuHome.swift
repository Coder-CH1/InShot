//
//  SideMenuHome.swift
//  inshot
//
//  Created by Mac on 03/08/2024.
//

import SwiftUI
import SwiftUISideMenu

struct SideMenuTest: View {
    @State var showSideMenu = false
    
    var body: some View {
        VStack {
            HStack {
            Button(action: {
                withAnimation {
                    self.showSideMenu.toggle()
                }
            }) {
                Image(systemName: "person")
                    .imageScale(.large)
                    .foregroundColor(.black)
                }
            .padding(.leading, -170)
            }
            Spacer()
        }.sideMenu(isShowing: $showSideMenu) {
            SideMenu(showSideMenu: $showSideMenu)
        }
    }
}


struct SideMenuTest_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuTest()
    }
}


struct SideMenu: View {
    @Binding var showSideMenu: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    self.showSideMenu = false
                }
            }) {
                HStack {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
            }
            Spacer()
                .frame(height: 90)
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "person.fill")
                        .font(.system(size: 60))
                        .background(.white)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("nickname")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                    Text("ID number")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.gray)
                }
            }
            Spacer()
                .frame(height: 50)
            Rectangle()
                .fill(.white)
                .frame(height: 1)
            Text("Help Center")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
            Text("Manage Account")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
            Spacer()
        }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}
