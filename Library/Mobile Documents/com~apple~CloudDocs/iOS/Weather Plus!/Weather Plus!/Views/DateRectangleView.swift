//
//  DateRectangleView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/17/21.
//

import SwiftUI

struct DateRectangleView: View {
	@Environment(\.colorScheme) var colorScheme // Dark or Light Mode
	let day: ForecastVM
	let dateFormatter = DateFormatter()
	init(day: ForecastVM) {
		dateFormatter.dateFormat = "E, MMM, d"
		self.day = day
	}
	
	var body: some View {
		VStack {
			Text(day.dayName)
				.foregroundColor(day.dayName == "SUN" ? .red : colorScheme == .light ? .white : .black)
				.font(.headline)
				.fontWeight(.black)
			Text(day.dayNumber)
				.font(.largeTitle)
				.fontWeight(.bold)
			Text(day.monthName)
				.font(.headline)
				.fontWeight(.black)
		}
		.frame(width: 55, height: 70, alignment: .center)
		.padding(.vertical)
		.background(RoundedRectangle(cornerRadius: 10)
			.fill(colorScheme == .light ? Color.black : Color.white))
		.foregroundColor(colorScheme == .light ? .white : .black)
	}
}


// NOTE:  IF you want to have a preview here you are going to have to have a sample ForecastVM to use in the preview

//struct DateRectangleView_Previews: PreviewProvider {
//    static var previews: some View {
//        DateRectangleView()
//    }
//}
