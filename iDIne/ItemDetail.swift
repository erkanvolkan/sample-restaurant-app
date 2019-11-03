//
//  ItemDetail.swift
//  iDIne
//
//  Created by Erkan on 9/19/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @State var showDetails = false
   
    var item: MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
            Image(item.mainImage)
            Text("Photo: \(item.photoCredit)")
                .padding(4)
                .background(Color.black)
                .font(.caption)
                .foregroundColor(.white)
                .offset(x: -22, y: -5)
            }
            
            Text(item.description)
            .padding(4)
            
            Button("Order This"){
                self.order.add(item: self.item)
            }
            
            
            Spacer()
            
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
            
    
    
}

}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example)
    }
}
