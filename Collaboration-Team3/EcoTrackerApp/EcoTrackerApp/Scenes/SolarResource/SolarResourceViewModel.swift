//
//  SolarResourceViewModel.swift
//  EcoTrackerApp
//
//  Created by Luka Gazdeliani on 29.11.23.
//

import Foundation
import GenericNetworkLayer


protocol SolarViewDelegate: AnyObject {
    func avgDirectNormIrrFetched(_ directNormalIrr: Double)
    func avgGlobalHorIrrFetched(_ globalHorIrr: Double)
    func avgTiltLatFetched(_ tilt: Double)
    func showError(_ error: Error)
}

final class SolarResourceViewModel {
    private let networkManager: NetworkService
    
    weak var delegate: SolarViewDelegate?
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
    
    func fetchDirectNormIrr (with cityName: String) {
        let urlString = "https://developer.nrel.gov/api/solar/solar_resource/v1.json?api_key=DEMO_KEY&lat=40&lon=-105"
        
        guard let cityNameUrl = URL(string: urlString) else {
            delegate?.showError(NetworkError.error(error: Error.self as! Error))
            return
        }
        
        networkManager.request(with: cityNameUrl) { [weak self] (result: Result<CityIDResponse, Error>) in
            switch result {
            case .success(let response):
                guard let firstResult = response.results.first else {
                    self?.delegate?.showError(NetworkError.error(error: Error.self as! Error))
                    return
                }
                self?.delegate?.avgDirectNormIrrFetched(Double(firstResult.id))
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
    
    func fetchGlobalHorIrr (with cityName: String) {
  
        let urlString = "https://developer.nrel.gov/api/solar/solar_resource/v1.json?api_key=DEMO_KEY&address=inglewood"
        
        guard let cityNameUrl = URL(string: urlString) else {
            delegate?.showError(NetworkError.error(error: Error.self as! Error))
            return
        }
        
        networkManager.request(with: cityNameUrl) { [weak self] (result: Result<CityIDResponse, Error>) in
            switch result {
            case .success(let response):
                guard let firstResult = response.results.first else {
                    self?.delegate?.showError(NetworkError.error(error: Error.self as! Error))
                    return
                }
                self?.delegate?.avgGlobalHorIrrFetched (Double(firstResult.id))
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
    

    
    
    
    
    
    
    
    
}



