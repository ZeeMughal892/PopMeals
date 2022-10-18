//
//  ContentView.swift
//  PopMeals
//
//  Created by Muhammad Zeeshan on 18/10/2022.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var viewModel = PopMealViewModel()
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.orders, id: \.orderId) { order in
                            OrderCardView(order: order).frame(width: 320, height: 150)
                        }
                    }
                    .padding()
                }
                VStack {
                    SettingRow(image: "profileIcon" , title: Strings.Common.myProfile)
                    SettingRow(image: "addressIcon" , title: Strings.Common.myAddresses)
                }
                Spacer()
                Button(action: {}, label: {
                    Text(Strings.Button.logout)
                        .foregroundColor(.gray)
                })
            }
            .navigationTitle(Strings.Common.myAccount)
        }
        .onAppear {
            viewModel.getOrders()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
