//
//  Forecast.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 2/10/21.
//

import UIKit
import CoreLocation

struct Forecast: Codable {
	struct Daily: Codable {
		let dt: Date
		let sunrise: Date
		let sunset: Date

		struct Temp: Codable {
			let day: Double
			let min: Double
			let max: Double
			let night: Double
			let eve: Double
			let morn: Double
		}
		let temp: Temp

		struct FeelsLike: Codable {
			let day: Double
			let night: Double
			let eve: Double
			let morn: Double
		}
		let feelsLike: FeelsLike

		let pressure: Int
		let humidity: Int
		let dewPoint: Double
		let windSpeed: Double
		let windDeg: Double


		struct Weather: Codable {
			let id: Int
			let main: String
			let description: String
			let icon: String
		}
		let weather: [Weather]

		let clouds: Int
		let pop: Double
		let uvi: Double
	}
	let daily: [Daily]
}
