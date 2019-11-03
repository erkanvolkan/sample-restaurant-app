//
//  CheckoutView.swift
//  iDIne
//
//  Created by Erkan on 9/19/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["cash", "Credit card", "idine points"]
    static let pickUpTimes = ["Now","Tonight","Tomorrow Morning"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var pickUpTime = 1
    
    
    var totalPrice: Double{
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
        
    }
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(0 ..< Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails){
                    Text("add idine loyalty card")
                }
                if (addLoyaltyDetails){
                   TextField("Enter your ID ine ID", text: $loyaltyNumber)
                }
            }
//            Section{
//                Picker("select your pick up time!", selection: $pickUpTime){
//                    ForEach(0 ..< Self.pickUpTimes.count){
//                        Text(Self.pickUpTimes[$0])
//                    }
//                }
//            }
            Section(header: Text("Add a tip ?")){
                Picker("Percentage:",selection: $tipAmount){
                    ForEach(0 ..< Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                .font(.largeTitle)
            ){
                Button("Confirmed order"){
                    self.showingPaymentAlert.toggle()
                }
            }
        }.navigationBarTitle(Text("payment"), displayMode: .inline)
            .alert(isPresented: $showingPaymentAlert){
                Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
