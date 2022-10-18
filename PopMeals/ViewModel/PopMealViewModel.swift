//
//  PopMealViewModel.swift
//  PopMeals
//
//  Created by Muhammad Zeeshan on 18/10/2022.
//

import Foundation

class PopMealViewModel: ObservableObject {
    
    @Published var orders: [Order] = []
    
    //Fetching All Orders
    func getOrders() {
        guard let url = URL(string: ApiUrls.getAllOrders) else { fatalError(Strings.Error.missingurl) }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(Strings.Error.request, error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let order = try JSONDecoder().decode(PopMealModel.self, from: data)
                        self.orders.append(contentsOf: order.orders)
                    } catch let error {
                        print(Strings.Error.decoding, error)
                    }
                }
            } else if response.statusCode == 503 {
                print(Strings.Error.ohNo)
            }
        }
        dataTask.resume()
    }
    
    func convertUnixToDate(code: Double) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(code))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "HH:mm a" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    func setOrderStatus(code: Double) -> String {
        var status = ""
        let timeInterval = Date().timeIntervalSince1970
        if timeInterval > TimeInterval(code) {
            status = Strings.Status.delivered
        } else if code == 0 {
            status = Strings.Status.cancelled
        } else {
            status = Strings.Status.confirmed
        }
        return status
    }
}
