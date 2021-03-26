//
//  Column2DataView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/18/21.
//

import SwiftUI

struct Column2DataView: View {
	
	@State var popUpKeys = Keys()
	@State private var isShowing = false
	var forecastListVM = ForecastListVM()
	
	let day: ForecastVM
	let dateFormatter = DateFormatter()
	init(day: ForecastVM) {
		dateFormatter.dateFormat = "E, MMM, d"
		self.day = day
	}
	
	var body: some View {
		VStack(alignment: .center) {
			Text(day.high)
				.modifier(TextSmall())
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.high
					popUpKeys.desc = K.Desc.high
					popUpKeys.image = "thermometer.sun.fill"
					popUpKeys.val1 = day.high
					popUpKeys.routine = 1
					isShowing = true
				}
					
			Text(day.clouds)
				.modifier(TextSmall())
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.clouds
					popUpKeys.desc = K.Desc.clouds
					popUpKeys.image = "cloud.fill"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.clouds
					popUpKeys.routine = 2
					isShowing = true
				}
				
					
			HStack {
				Text(day.wind)
				Text(day.windDir)
					.offset(x: -6)
					.font(.footnote)
			}
			.modifier(TextSmall())
			.onTapGesture(count: 1) {
				day.setClassToEmpty()
				popUpKeys.title = K.Title.wind
				popUpKeys.desc = K.Desc.wind
				popUpKeys.image = "wind"
				popUpKeys.foreColor = .blue
				popUpKeys.val1 = day.wind
				popUpKeys.val2 = day.windDir
				popUpKeys.routine = 5
				isShowing = true
			}
			
			Text(day.sunrise)
				.modifier(TextSmall())
				.onTapGesture(count: 1) {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.sunrise
					popUpKeys.desc = K.Desc.sunrise
					popUpKeys.image = "sunrise.fill"
					popUpKeys.foreColor = .yellow
					popUpKeys.val1 = day.sunrise
					popUpKeys.routine = 5
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

//struct Column2DataView_Previews: PreviewProvider {
//    static var previews: some View {
//        Column1DataView()
//    }
//}
