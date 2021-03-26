//
//  Column4DataView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/18/21.
//

import SwiftUI

struct Column4DataView: View {
	
	@State var popUpKeys = Keys()
	@State private var isShowing = false
	let day: ForecastVM
	let dateFormatter = DateFormatter()
	init(day: ForecastVM) {
		dateFormatter.dateFormat = "E, MMM, d"
		self.day = day
	}
	
	var body: some View {
		VStack(alignment: .center) {
			Text(day.low)
				.modifier(TextSmall())
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.low
					popUpKeys.desc = K.Desc.low
					popUpKeys.image = "thermometer.snowflake"
					popUpKeys.val1 = day.low
					popUpKeys.routine = 1
					isShowing = true
				}
			
			Text(day.pop)
				.modifier(TextSmall())
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.precip
					popUpKeys.desc = K.Desc.precip
					popUpKeys.image = "drop.fill"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.pop
					popUpKeys.routine = 2
					isShowing = true
				}
			
			Text(day.humidity)
				.modifier(TextSmall())
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.humidity
					popUpKeys.desc = K.Desc.humidity
					popUpKeys.image = "humidity"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.humidity
					popUpKeys.routine = 3
					isShowing = true
				}
			
			Text(day.sunset)
				.modifier(TextSmall())
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.sunset
					popUpKeys.desc = K.Desc.sunset
					popUpKeys.image = "sunset.fill"
					popUpKeys.foreColor = .orange
					popUpKeys.val1 = day.sunset
					popUpKeys.routine = 2
					isShowing = true
				}
		}
		
		Text("").hidden()
			.sheet(isPresented: $isShowing) {
				PopUpView(popUpKeys: popUpKeys, isPresented: $isShowing, onDismiss: {
					self.isShowing = false
				})
			}
	}
}

//struct Column4DataView_Previews: PreviewProvider {
//    static var previews: some View {
//        Column1DataView()
//    }
//}
