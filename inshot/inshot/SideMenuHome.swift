//
//  SideMenuHome.swift
//  inshot
//
//  Created by Mac on 03/08/2024.
//

import SwiftUI

struct SideMenuHome: View {
    @State var showSideMenu = false
    var body: some View {
            VStack {
                Button {
                    showSideMenu.toggle()
                } label: {
                    Image(systemName: "person")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.trailing, 320)
    }
}

struct SideMenuHome_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHome()
    }
}

struct SideMenu: View {
    @Binding var isShowing: Bool
    var body: some View {
        VStack {
          Text("Menu items")
        }
        .frame(width: 250, height: UIScreen.main.bounds.height)
        .background(.gray.opacity(0.6))
    }
}
