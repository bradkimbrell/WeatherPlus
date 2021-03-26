//
//  ForecastVM.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 3/1/21.
//

import Foundation
import SwiftUI

struct ForecastVM {
	
	let forecast: Forecast.Daily
	var units: Int
	@StateObject var popUpKeys = Keys()
	
	private static var dateFormatterDayName: DateFormatter {
		let dateFormatter			= DateFormatter()
		dateFormatter.dateFormat	= "E"
		return dateFormatter
	}
	
	private static var dateFormatterDayNumber: DateFormatter {
		let dateFormatter			= DateFormatter()
		dateFormatter.dateFormat	= "d"
		return dateFormatter
	}
		
	private static var dateFormatterMonthName: DateFormatter {
		let dateFormatter			= DateFormatter()
		dateFormatter.dateFormat	= "MMM"
		return dateFormatter
	}
	
	private static var timeFormatter: DateFormatter {
		let dateFormatter			= DateFormatter()
		dateFormatter.dateFormat	= "h:mm a"
		return dateFormatter
	}
	
	// Whole Numbers
	private static var numberFormatter: NumberFormatter {
		let numberFormatter						= NumberFormatter()
		numberFormatter.maximumFractionDigits	= 0
		return numberFormatter
	}
	
	// Numbers w/1 decimal place
	private static var numberFormatterOneDigit: NumberFormatter {
		let numberFormatterOneDigit							= NumberFormatter()
		numberFormatterOneDigit.maximumFractionDigits	= 1
		return numberFormatterOneDigit
	}
	
	// Percentages
	private static var numberFormatterPercentage: NumberFormatter {
		let numberFormatterPercentage				= NumberFormatter()
		numberFormatterPercentage.numberStyle		= .percent
		return numberFormatterPercentage
	}
	
	private func convertTemp(_ temp: Double) -> Double {
		let celsius = temp - 273.5 // Convert from Kelvin
		if units == 0 {
			return celsius
		} else {
			return ((celsius * 9) / 5) + 32 // Farenheit
		}
	}
	
	private func convertWindSpeed() -> Double {
		let mps = forecast.windSpeed // in meters per second
		if units == 0 { // Metric
			return mps
		} else { // Convert to imperial units
			return mps * 2.23694 // convert meters per second to miles per hour
		}
	}
	
	private func convertDegreesToText() -> String {
		var windRounded: Int
		windRounded = Int(Double(forecast.windDeg) / 22.5 + 0.5)
		let textWindDir: [String] =
			["N","NNE","NE","ENE","E","ESE", "SE", "SSE",
				"S","SSW","SW","WSW","W","WNW","NW","NNW"]
		return textWindDir[(windRounded % 16)]

	}
	
	func setClassToEmpty() {
		popUpKeys.title	= ""
		popUpKeys.desc	= ""
		popUpKeys.image	= ""
		popUpKeys.val1	= ""
		popUpKeys.val2	= ""
		popUpKeys.val3	= ""
		popUpKeys.val4	= 0.0
		popUpKeys.routine = 1
	}
	
	func getWeatherImage() -> String {
		switch forecast.weather[0].id {
			case 200, 201, 202, 210, 211, 212, 221, 230, 231, 232:			// Thunderstorms
				return "Children in Rain"
			case 300, 301, 302, 310, 311, 312, 313, 314, 321:					// Drizzle
				return "Children in Rain"
			case 500, 501, 502, 503, 504, 511, 520, 521, 522, 531:			// Rain
				return "Children in Rain"
			case 600, 601, 602, 611, 612, 613, 615, 616, 620, 621, 622:	// Snow
				return "Children in Snow"
			case 701, 711, 721, 731, 741, 751, 761, 762, 771, 781:			// Atmosphere
				return "Children in Sun"
			case 800:																	// Clear
				return "Children in Sun"
			case 801, 802, 803, 804:												// Clouds
				return "Children in Clouds"
			default:
				return "Children in Sun"
		}
	}
	
	var dayNumber: String {
		return Self.dateFormatterDayNumber.string(from: forecast.dt)
	}
	
	var dayName: String {
		return Self.dateFormatterDayName.string(from:  forecast.dt).uppercased()
	}
	
	var monthName: String {
		return Self.dateFormatterMonthName.string(from: forecast.dt).uppercased()
	}
	
	var sunrise: String { // Return 6:34a rather than 6:34am
		let sunRise: String		= String(Self.timeFormatter.string(from: forecast.sunrise))
		var sunRiseShort		= String(sunRise.dropLast().lowercased())
		sunRiseShort			= sunRiseShort.replacingOccurrences(of: " ", with: "")
		return "\(sunRiseShort)"
	}
	
	var sunset: String { // Return 7:34p rather than 7:34pm
		let sunSet: String	= String(Self.timeFormatter.string(from: forecast.sunset))
		var sunSetShort		= String(sunSet.dropLast().lowercased())
		sunSetShort			= sunSetShort.replacingOccurrences(of: " ", with: "")
		return "\(sunSetShort)"
	}
	
	var overview: String {
		return "\(forecast.weather[0].description.capitalized)"
	}

	var high: String {
		return "\(Self.numberFormatter.string(for: convertTemp(forecast.temp.max)) ?? "0")°"
	}

	var low: String {
		return "\(Self.numberFormatter.string(for: convertTemp(forecast.temp.min)) ?? "0")°"
	}

	func getFeelsLikeByTime() -> String {
		
		var temperatureAtTimeOfDay: Double
		let dateComponents		= DateComponents()
		let timeOfDay			= dateComponents.hour
		
		guard let unwrapTOD = timeOfDay else {
			return "\(Self.numberFormatter.string(for: convertTemp(forecast.feelsLike.day)) ?? "0")°"
		}
		
		switch unwrapTOD {
			case 5...10: // Morning
				temperatureAtTimeOfDay = forecast.feelsLike.morn
			case 11...16: // Afternoon (using Day)
				temperatureAtTimeOfDay = forecast.feelsLike.day
			case 17...20: // Evening
				temperatureAtTimeOfDay = forecast.feelsLike.eve
			case 21...23: // Night
				temperatureAtTimeOfDay = forecast.feelsLike.night
			case 0...4: // Night
				temperatureAtTimeOfDay = forecast.feelsLike.night
			default: // use Day
				temperatureAtTimeOfDay = forecast.feelsLike.day
		}
		return "\(Self.numberFormatter.string(for: convertTemp(temperatureAtTimeOfDay)) ?? "0")°"
	}
	
	var dewPoint: String {
		return "\(Self.numberFormatter.string(for: convertTemp(forecast.dewPoint)) ?? "0")°"
	}
	
	var pop: String {
		return "\(Self.numberFormatterPercentage.string(for: forecast.pop) ?? "0%")"
	}
	
	var humidity: String {
		return "\(forecast.humidity)%"
	}
	
	var pressure: String {
		return "\(String(forecast.pressure))"  // units = mb = millibars
	}
	
	func getPressure() -> String {
		return "\(String(forecast.pressure))"
	}
	
	var uvi: String {
		let tempUVI = Double(forecast.uvi)
		return "\(String(format: "%.1f", tempUVI))"
	}
	
	func getUVIColor() -> Color {
		switch forecast.uvi {
			case 0.0...2.5:
				return .green
			case 2.51...5.5:
				return .yellow
			case 5.51...7.5:
				return .orange
			case 7.51...10.5:
				return .red
			case 10.51...:
				return .purple
			default:
				return .green
		}
	}
	
	func getUVIDanger() -> String {
		switch forecast.uvi {
			case 0.0...2.5:
				return K.UVI.low
			case 2.51...5.5:
				return K.UVI.mod
			case 5.51...7.5:
				return K.UVI.high
			case 7.51...10.5:
				return K.UVI.veryHigh
			case 10.51...:
				return K.UVI.extreme
			default:
				return K.UVI.unknown
		}
	}
	
	func getUVIDangerText() -> String {
		switch forecast.uvi {
			case 0.0...2.5:
				return K.UVIDanger.low
			case 2.51...5.5:
				return K.UVIDanger.mod
			case 5.51...7.5:
				return K.UVIDanger.high
			case 7.51...10.5:
				return K.UVIDanger.veryHigh
			case 10.51...:
				return K.UVIDanger.extreme
			default:
				return K.UVIDanger.unknown
		}
	}
	
	var clouds: String {
		return "\(forecast.clouds)%"
	}
	
	var wind: String {
		let windSpeed = convertWindSpeed()
		return "\(String(format: "%.0f", windSpeed))"
	}
	
	var windDir: String {
		let windDirText = convertDegreesToText()
		return "\(windDirText)".lowercased()
	}
	
	var windSpeedUnits: String {
		if units == 0 {
			return "mps"
		} else {
			return "mph"
		}
	}
}


