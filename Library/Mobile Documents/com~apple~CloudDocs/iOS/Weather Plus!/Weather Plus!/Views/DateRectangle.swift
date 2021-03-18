//
//  DateRectangle.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/17/21.
//

import SwiftUI

struct DateRectangle: View {
	
	let day: Forecast.Daily
	let dateFormatter = DateFormatter()
	init(day: Forecast.Daily) {
		dateFormatter.dateFormat = "E, MMM, d"
		self.day = day
	}
	
    var body: some View {
		HStack {
			// Date Rectangle
			VStack(alignment: .center) {
				Text(verbatim: day.dayName)

// Stewart - somehow colorScheme started returning "SwiftUI.colorScheme.dark" rather than ".dark"
//           The statement below this comment was being used in place of the line following. Not sure why it changed?
// 					.foregroundColor(day.dayName == "SUN" ? .red : colorScheme == .light ? .white : .black)
					
					.foregroundColor(.black)
					.font(.headline)
					.fontWeight(.black)
				Text(verbatim: day.dayNumber)
					.font(.largeTitle)
					.fontWeight(.bold)
				Text(verbatim: day.monthName)
					.font(.headline)
					.fontWeight(.black)
// Stewart - I have never had to use the verbatim: label but without it here I get the error
//             that I must insert it in the Text statements???
			}
		}
    }
}

struct DateRectangle_Previews: PreviewProvider {
    static var previews: some View {
        DateRectangle()
    }
}
