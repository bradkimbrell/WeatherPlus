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
	
	#if DEBUG
//	static let sample =
//		forecast(
//			lat: 48.0406,
//			lon: -84.5037,
//			timezone: "America/Nipigon",
//			timezone_offset: -14400,
//			dt: 1616259600,
//			sunrise: 1616240421,
//			sunset: 1616284224,
//			max: 281.15,
//			min: 270.41,
//			feelsLike: 272.23,
//			pressure: 1028,
//			humidity: 60,
//			dewPoint: 272.2,
//			windSpeed: 5.31,
//			windDeg: 218,
//			main: "Clear",
//			description: "clear sky",
//			icon: "01d",
//			clouds: 0,
//			pop: 0,
//			uvi: 3.66
//		)

	#endif
}
