//
//  PopMealModel.swift
//  PopMeals
//
//  Created by Muhammad Zeeshan on 18/10/2022.
//

import Foundation

struct PopMealModel: Codable {
    let orders: [Order]
}

struct Order: Codable, Hashable {
    let orderId: Int
    let arrivesAtUtc: Double?
    let paidWith: String
    let totalPaid: Double
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case arrivesAtUtc = "arrives_at_utc"
        case paidWith = "paid_with"
        case totalPaid = "total_paid"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.orderId = try container.decode(Int.self, forKey: .orderId)
        self.arrivesAtUtc = try container.decode(Double.self, forKey: .arrivesAtUtc)
        self.paidWith = try container.decode(String.self, forKey: .paidWith)
        self.totalPaid = try container.decode(Double.self, forKey: .totalPaid)
    }
}

