//
//  SolarResourceModel.swift
//  EcoTrackerApp
//
//  Created by Luka Gazdeliani on 29.11.23.
//

import Foundation


struct SolarData: Codable {
    let avgDNI: MonthlyAverage
    let avgGHI: MonthlyAverage
    let avgLatTilt: MonthlyAverage

    enum CodingKeys: String, CodingKey {
        case avgDNI = "avg_dni"
        case avgGHI = "avg_ghi"
        case avgLatTilt = "avg_lat_tilt"
    }
}

struct MonthlyAverage: Codable {
    let annual: Double
    let monthly: [String: Double]
}

func fetchData(completion: @escaping (Result<SolarData, Error>) -> Void) {
    let urlString = "https://developer.nrel.gov/api/solar/solar_resource/v1.json?api_key=DEMO_KEY&lat=40&lon=-105"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        return
    }

    let task = URLSession.shared.dataTask(with: url) { data, _, error in
        guard let data = data, error == nil else {
            completion(.failure(error ?? NSError(domain: "Network Error", code: 1, userInfo: nil)))
            return
        }

        do {
            let decoder = JSONDecoder()
            let solarData = try decoder.decode(SolarData.self, from: data)
            completion(.success(solarData))
        } catch {
            completion(.failure(error))
        }
    }

    task.resume()
}

func main() {
    fetchData { result in
        switch result {
        case .success(let solarData):
            let avgDNIMonthly = solarData.avgDNI.monthly
            let avgGHIMonthly = solarData.avgGHI.monthly
            let avgLatTiltMonthly = solarData.avgLatTilt.monthly

        case .failure(let error):
            print("Error fetching data: \(error)")
        }
    }
}
