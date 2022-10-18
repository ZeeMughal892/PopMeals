//
//  SettingRow.swift
//  PopMeals
//
//  Created by Muhammad Zeeshan on 18/10/2022.
//

import SwiftUI

struct SettingRow: View {

    var image: String
    var title: String

    var body: some View {
        HStack {
            Image(image)
            Text(title)
                .font(.custom(FontsManger.barlow.regular, size: 15.0))
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
    }
}
