//
//  WeatherIcons.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 2/20/21.
//

//import Foundation
//
//class WeatherIcons: ObservableObject {
//	let forecast: Forecast.Daily
//	
//	init() {
//		getWeatherImage()
//	}
//	
//	func getWeatherImage() -> String {
//		
//		switch forecast.weather[0].id {
//			case 200, 201, 202, 210, 211, 212, 221, 230, 231, 232:		// Thunderstorms
//				return "Children in Rain"
//			case 300, 301, 302, 310, 311, 312, 313, 314, 321:			// Drizzle
//				return "Children in Rain"
//			case 500, 501, 502, 503, 504, 511, 520, 521, 522, 531:		// Rain
//				return "Children in Rain"
//			case 600, 601, 602, 611, 612, 613, 615, 616, 620, 621, 622:	// Snow
//				return "Children in Snow"
//			case 701, 711, 721, 731, 741, 751, 761, 762, 771, 781:		// Atmosphere
//				return "Children in Sun"
//			case 800:												// Clear
//				return "Children in Sun"
//			case 801, 802, 803, 804:									// Clouds
//				return "Children in Clouds"
//			default:
//				return "Children in Sun"
//		}
//	}
//}


/*
ID	Main		Description							Icon

200	T'storm	thunderstorm with light rain		11d 	cloud.bolt.rain.fill	light blue
201	T'storm	thunderstorm with rain				11d		cloud.bolt.rain.fill	blue
202	T'storm	thunderstorm with heavy rain		11d		cloud.bolt.rain.fill	dark blue
210	T'storm	light thunderstorm					11d		cloud.bolt.fill		light blue
211	T'storm	thunderstorm							11d		cloud.bolt.fill		blue
212	T'storm	heavy thunderstorm					11d		cloud.bolt.fill		dark blue
221	T'storm	ragged thunderstorm					11d
230	T'storm	thunderstorm with light drizzle		11d
231	T'storm	thunderstorm with drizzle			11d
232	T'storm	thunderstorm with heavy drizzle		11d
300	Drizzle	light intensity drizzle				09d
301	Drizzle	drizzle								09d
302	Drizzle	heavy intensity drizzle				09d
310	Drizzle	light intensity drizzle rain		09d
311	Drizzle	drizzle rain							09d
312	Drizzle	heavy intensity drizzle rain		09d
313	Drizzle	shower rain and drizzle				09d
314	Drizzle	heavy shower rain and drizzle		09d
321	Drizzle	shower drizzle						09d
500	Rain	light rain									10d
501	Rain	moderate rain								10d
502	Rain	heavy intensity rain						10d
503	Rain	very heavy rain							10d
504	Rain	extreme rain								10d
511	Rain	freezing rain								13d
520	Rain	light intensity shower rain				09d
521	Rain	shower rain								09d
522	Rain	heavy intensity shower rain				09d
531	Rain	ragged shower rain						09d
600	Snow	light snow									13d
601	Snow	Snow										13d
602	Snow	Heavy snow									13d
611	Snow	Sleet										13d
612	Snow	Light shower sleet						13d
613	Snow	Shower sleet								13d
615	Snow	Light rain and snow						13d
616	Snow	Rain and snow								13d
620	Snow	Light shower snow							13d
621	Snow	Shower snow								13d
622	Snow	Heavy shower snow							13d
701	Mist	mist										50d
711	Smoke	Smoke										50d
721	Haze	Haze	 									50d
731	Dust	sand/ dust whirls							50d
741	Fog		fog											50d
751	Sand	sand										50d
761	Dust	dust	 									50d
762	Ash		volcanic ash								50d
771	Squall	squalls									50d
781	Tornado	tornado								50d
800	Clear	clear sky									01d
801	Clouds	few clouds: 11-25%						02d
802	Clouds	scattered clouds: 25-50%	 				03d
803	Clouds	broken clouds: 51-84%	 				04d
804	Clouds	overcast clouds: 85-100%	 				04d
*/
