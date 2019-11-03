//
//  AppView.swift
//  iDIne
//
//  Created by Erkan on 9/19/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView().tabItem{
                Image(systemName: "list.dash")
                Text("menu")
            }
            OrderView().tabItem{
                Image(systemName:"square.and.pencil")
                Text("order")
            }
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}

