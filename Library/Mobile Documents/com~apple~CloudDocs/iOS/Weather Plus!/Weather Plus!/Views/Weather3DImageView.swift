//
//  Weather3DImageView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/18/21.
//

import SwiftUI

struct Weather3DImageView: View {
	let day: ForecastVM
	let dateFormatter = DateFormatter()
	init(day: ForecastVM) {
		dateFormatter.dateFormat = "E, MMM, d"
		self.day = day
	}
	
    var body: some View {
		Image(day.getWeatherImage())
			.resizable()
			.scaledToFit()
			.frame(maxWidth: .infinity, alignment: .leading)
			.cornerRadius(10)
			.ignoresSafeArea(.all)
    }
}

//struct Weather3DImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        Weather3DImageView()
//    }
//}
