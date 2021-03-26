//
//  ForecastListVM.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 3/1/21.
//

import CoreLocation
import Foundation
import SwiftUI

class ForecastListVM: ObservableObject {
	struct AppError: Identifiable {
		let id = UUID().uuidString
		let errorString: String
	}
	
	@Published var forecasts: [ForecastVM] = []
	var appError: AppError? = nil
	@Published var isLoading: Bool = false
		
	@AppStorage("location") var storageLocation: String = ""
	@Published var location = ""
	
	@AppStorage("units") var units: Int = 1 {
		didSet {
			for i in 0..<forecasts.count {
				forecasts[i].units = units
			}
		}
	}
	
	init() {
		location = storageLocation
		getWeatherForecast()
	}
	
	func getWeatherForecast() {
		storageLocation = location
		UIApplication.shared.endEditing() // Dismiss keyboard
		if location == "" {
			forecasts = []
		} else {
			isLoading			= true
			let apiURL		= "https://api.openweathermap.org/data/2.5/onecall"
			let exclude		= "current,minutely,hourly,alerts"
			let apiKey		= "35db4c23efb0026b5505cfc30fbecaee"
			let apiService	= APIServiceCombine.shared
			
			CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
				if let error = error as? CLError {
					switch error.code {
						case .locationUnknown,
							  .geocodeFoundNoResult,
								.geocodeFoundPartialResult:
							self.appError = AppError(
								errorString: NSLocalizedString(
									K.Error.noLoc,
									comment: ""))
						case .network:
							self.appError = AppError(
								errorString: NSLocalizedString(
									K.Error.noNet,
									comment: ""))
						default:
							self.appError = AppError(
								errorString: error.localizedDescription)
					}
					self.isLoading	= false
					self.appError		= AppError(errorString: error.localizedDescription)
				}
				
				if let lat = placemarks?.first?.location?.coordinate.latitude,
					let lon = placemarks?.first?.location?.coordinate.longitude {
					let weatherURL =
					 "\(apiURL)?lat=\(lat)&lon=\(lon)&exclude=\(exclude)&appid=\(apiKey)"

					apiService.getJSON(urlString: weatherURL,
										dateDecodingStrategy: .secondsSince1970) {
						(result: Result<Forecast, APIServiceCombine.APIError>) in
						switch result {
							case .success(let forecast):
								DispatchQueue.main.async {
									self.isLoading	= false
									self.forecasts 	= forecast.daily.map {
										ForecastVM(forecast: $0, units: self.units)
									}
								}
							case .failure(let apiError):
								switch apiError {
									case .error(let errorString):
										self.isLoading	= false
										self.appError		= AppError(errorString: errorString)
								}
						}
					}
				}
			}
		}
	}
}
