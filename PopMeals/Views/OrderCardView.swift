//
//  CardView.swift
//  PopMeals
//
//  Created by Muhammad Zeeshan on 18/10/2022.
//

import SwiftUI

struct OrderCardView: View {

    var order: Order
    @ObservedObject var viewModel = PopMealViewModel()

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(Strings.Common.orderNumber)
                    .bold()
                Text("#" + String(order.orderId))
                Spacer(minLength: 32)
                VStack(alignment: .leading) {
                    HStack {
                        Text(Strings.Common.arrivesAt)
                        Spacer()
                        
                        Text(viewModel.convertUnixToDate(code: order.arrivesAtUtc ?? 0))
                        Spacer()
                    }.padding(1)
                    HStack {
                        Text(Strings.Common.paidWith)
                        Spacer()
                        
                        Text(order.paidWith)
                        Spacer()
                    }
                    .padding(1)
                    HStack {
                        Text(Strings.Common.status)
                        Spacer()
                        
                        Text(viewModel.setOrderStatus(code: order.arrivesAtUtc ?? 0))
                        Spacer()
                    }.padding(1)
                }
                .foregroundColor(Color("subTextColor"))
            }
            .font(.system(size: 12.0))
            .padding()
            .background(Color("cardBg"))
            .cornerRadius(8.0)
        }
    }
}
