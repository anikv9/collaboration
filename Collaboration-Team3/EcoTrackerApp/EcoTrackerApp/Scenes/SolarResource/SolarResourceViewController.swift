//
//  SolarResourceViewController.swift
//  EcoTrackerApp
//
//  Created by Luka Gazdeliani on 29.11.23.
//

import UIKit

class SolarResourceViewController: UIViewController {
    //    func updateSearchResults(for searchController: UISearchController) {
    //        self.viewModel.updateSearchController(searchBarText: searchController.searchBar.text)
    //    }
    //    
    //    
    
    //
    //    private let searchController = UISearchController(searchResultsController: nil)
    //    private let viewModel: SolarResourceViewController
    
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.setupSearchController()
        view.backgroundColor = .white
        
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private func createInfoStackView(_ title: String, detail: String) {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)

        let averageDirectNormalIrradiance = UILabel()
        averageDirectNormalIrradiance.text = "Average Direct Normal Irradiance: "
        averageDirectNormalIrradiance.textColor = .black
        averageDirectNormalIrradiance.numberOfLines = 0
        averageDirectNormalIrradiance.font = .systemFont(ofSize: 16, weight: .regular)

        let averageGlobalHorizontalIrradiance = UILabel()
        averageGlobalHorizontalIrradiance.text = "Average Global Horizontal Irradiance: "
        averageGlobalHorizontalIrradiance.textColor = .black
        averageGlobalHorizontalIrradiance.numberOfLines = 0
        averageGlobalHorizontalIrradiance.font = .systemFont(ofSize: 16, weight: .regular)

        let averageTiltatLatitude = UILabel()
        averageTiltatLatitude.text = "Average Tilt at Latitude: "
        averageTiltatLatitude.textColor = .black
        averageTiltatLatitude.numberOfLines = 0
        averageTiltatLatitude.font = .systemFont(ofSize: 16, weight: .regular)

        stackView.addArrangedSubview(averageDirectNormalIrradiance)
        stackView.addArrangedSubview(averageGlobalHorizontalIrradiance)
        stackView.addArrangedSubview(averageTiltatLatitude)

        mainStackView.addArrangedSubview(stackView)
    }
    
}
    
//    
//    private func setupSearchController() {
//            self.searchController.searchResultsUpdater = self
//            self.searchController.obscuresBackgroundDuringPresentation = false
//            self.searchController.hidesNavigationBarDuringPresentation = false
//            self.searchController.searchBar.placeholder = "Search Cryptos"
//            
//            self.navigationItem.searchController = searchController
//            self.definesPresentationContext = false
//            self.navigationItem.hidesSearchBarWhenScrolling = false
//            
//            searchController.delegate = self
//            searchController.searchBar.delegate = self
//            searchController.searchBar.showsBookmarkButton = true
//            searchController.searchBar.setImage(UIImage(systemName: "line.horizontal.3.decrease"), for: .bookmark, state: .normal)
//    }
//    
// 
//    
//}



