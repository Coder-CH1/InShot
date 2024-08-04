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
        NavigationView {
            List(1..<6) { index in
                Text("Item \(index)")
            }
            .navigationBarTitle("Dashboard", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showSideMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ))
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
              Text("close menu")
                .foregroundColor(.white)
                .font(.system(size: 14))
                .padding(.leading, 15.0)
            }
          }.padding(.top, 20)
            Divider()
                .frame(height: 20)
            Text("Sample item 1")
                .foregroundColor(.white)
            Text("Sample item 2")
                .foregroundColor(.white)
           Spacer()
         }.padding()
         .frame(maxWidth: .infinity, alignment: .leading)
         .background(Color.black)
         .edgesIgnoringSafeArea(.all)
    }
}
