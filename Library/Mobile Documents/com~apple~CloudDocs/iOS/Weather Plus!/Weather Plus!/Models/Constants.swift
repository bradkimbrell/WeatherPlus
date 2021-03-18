//
//  Constants.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 3/7/21.
//

import Foundation

// Stewart - I learned about localization from Paul Hudson in his Ultimate Portfolio course.
//           So these allow for easy translation of literals for other countries in the future.

struct K {
	static var units			= "Units"
	static var centigrade	= "°C"
	static var farenheit		= "°F"
	static var enterLoc		= "Enter Location: "
	static var millibars		= "mb"
	static var uvi			= "uvi"
	static var navTitle		= "Family Weather"
	static var tryLater		= "Please try again later!"
	static var fetchWeather	= "Fetching Weather"
	static var tapToDismiss	= "Tap to Dismiss"
	
	
	struct UVI {
		static var low		= "Low"
		static var mod		= "Moderate"
		static var high		= "High!"
		static var veryHigh	= "Very High!!"
		static var extreme	= "Extreme!!!"
		static var unknown	= "Unknown?"
	}
	
	
	struct UVIDanger {
		static var low		= 	"""
									Wear sunglasses on bright days. If you burn easily, cover up and use broad spectrum SPF-30+ sunscreen. Bright surfaces, sand, water, and snow will increase UV exposure.
									"""
		static var mod		= 	"""
									Stay in shade near midday when the Sun is strongest. If outdoors, wear sun-protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF-30+ sunscreen every 1.5 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such as sand, water, and snow will increase UV exposure.
									"""
		static var high		= 	"""
									Extra protection needed. Be careful outside, especially during late morning through mid-afternoon. If your shadow is shorter than you, seek shade and wear protective clothing, a wide-brimmed hat, and sunglasses. Generously apply a minimum of SPF-35, broad-spectrum sunscreen on exposed skin.
									"""
		static var veryHigh	= 	"""
									Minimize sun exposure between 10 a.m. and 4 p.m. If outdoors, seek shade and wear sun-protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF-35+ sunscreen every 1.5 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such as sand, water, and snow will increase UV exposure.
									"""
		static var extreme	= 	"""
									Try to avoid sun exposure between 10 a.m. and 4 p.m. If outdoors, seek shade and wear sun-protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF-35+ sunscreen every 1.5 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such as sand, water, and snow will increase UV exposure.
									"""
		static var unknown	=	"Unknown?"
	}
	
	
	struct Title {
		static var high		= "High Temperature"
		static var clouds	= "% Cloud Cover"
		static var wind		= "Wind Speed & Direction"
		static var sunrise	= "Sunrise (Time)"
		
		static var low		= "Low Temperature"
		static var precip	= "Chance of Precipation"
		static var humidity	= "Relative Humidity"
		static var sunset	= "Sunset (Time)"
		
		static var feels		= "'Feels Like' Temperature"
		static var dew		= "Dew Point"
		static var baro		= "Barometric Pressure"
		static var uvi		= "Ultraviolet Index"
	}
	
	
	struct Desc {
		static var high		= "Highest (warmest) expected temperature."
		static var clouds	= "Percentage of Cloud Cover expected."
		static var wind		= 	"""
									The expected speed and compass direction from which the wind will be blowing.
									"""
		static var sunrise	= "Expected time of Sunrise."
		static var low		= "Lowest (coolest) expected temperature."
		static var precip	= "Percentage of Chance of Precipation."
		static var humidity	= 	"""
									A quantity representing the amount of water vapor in the atmosphere.
									"""
		static var sunset	= "Expected time of Sunset."
		static var feels		= 	"""
									A measurement of how hot or cold it really feels like outside. The 'Feels Like' temperature relies on data including the ambient air temperature, relative humidity, & wind speed to determine how weather conditions feel to bare skin.
									"""
		static var dew		= 	"""
									The atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form.
									"""
		static var baro		=	"""
									Also known as atmospheric pressure. Defined as the force exerted by the atmosphere at a given point. It is known as the 'weight of the air' and is expressed in units known as millibars (mb).
									"""
		static var uvi		= 	"""
									A measure of the level of sunburning UV radiation. The values of the index range from 0 to 12+. The higher the UVI, the greater the potential for damage to the skin and eye, and the less time it takes for harm to occur.
									"""
	}
	
	
	struct Error {
		static var noLoc			= "Unable to determine location from this text."
		static var noNet			= "You do not appear to have a network connection."
		static var invalidURL	= "Error: Invalid URL"
		static var decoding		= "Decoding Error:"
	}
}
