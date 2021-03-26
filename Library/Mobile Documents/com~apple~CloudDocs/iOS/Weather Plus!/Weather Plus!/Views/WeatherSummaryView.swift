//
//  WeatherSummaryView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/18/21.
//

import SwiftUI

struct WeatherSummaryView: View {
	let day: ForecastVM
	let dateFormatter = DateFormatter()
	init(day: ForecastVM) {
		dateFormatter.dateFormat = "E, MMM, d"
		self.day = day
	}
	
	var body: some View {
		Text(day.overview).fontWeight(.semibold)
			.frame(maxWidth: .infinity, alignment: .center)
			.background(Color.blue)
			.foregroundColor(.white)
	}
}

//struct WeatherSummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherSummaryView()
//    }
//}
