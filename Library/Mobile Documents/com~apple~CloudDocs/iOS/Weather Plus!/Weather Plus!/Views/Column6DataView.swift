//
//  Column6DataView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/18/21.
//

//
//  Column4Data.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/18/21.
//

import SwiftUI

struct Column6DataView: View {
	
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
			Text(day.getFeelsLikeByTime())
				.modifier(TextStandard())
				.onTapGesture {
					popUpKeys.title = K.Title.feels
					popUpKeys.desc = K.Desc.feels
					popUpKeys.image = "thermometer"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.getFeelsLikeByTime()
					popUpKeys.val2 = ""
					popUpKeys.val3 = ""
					popUpKeys.val4 = 0.0
					popUpKeys.routine = 2
					isShowing = true
				}
			
			Text(day.dewPoint)
				.modifier(TextStandard())
				.onTapGesture {
					popUpKeys.title = K.Title.dew
					popUpKeys.desc = K.Desc.dew
					popUpKeys.image = "dewPoint"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.dewPoint
					popUpKeys.val2 = ""
					popUpKeys.val3 = ""
					popUpKeys.val4 = 0.0
					popUpKeys.routine = 3
					isShowing = true
				}
			
			HStack {
				Text(day.pressure)
					.font(.body)
				Text(K.millibars)
					.offset(x: -6)
					.font(.footnote)
			}
			.modifier(TextStandard())
			.onTapGesture {
				popUpKeys.title = K.Title.baro
				popUpKeys.desc = K.Desc.baro
				popUpKeys.image = "barometricPressure"
				popUpKeys.foreColor = .blue
				popUpKeys.val1 = day.pressure
				popUpKeys.val2 = K.millibars
				popUpKeys.val3 = ""
				popUpKeys.val4 = 0.0
				popUpKeys.routine = 4
				isShowing = true
			}
			
			HStack {
				Text(day.uvi)
				Text(K.uvi)
					.offset(x: -6)
					.font(.footnote)
			}
			.modifier(TextStandard())
			.foregroundColor(day.getUVIColor())
			.onTapGesture {
				popUpKeys.title = K.Title.uvi
				popUpKeys.desc = K.Desc.uvi
				popUpKeys.image = ""
				popUpKeys.foreColor = day.getUVIColor()
				popUpKeys.val1 = day.uvi
				popUpKeys.val2 = day.getUVIDanger()
				popUpKeys.val3 = day.getUVIDangerText()
				popUpKeys.val4 = Double(day.uvi) ?? 0.0
				popUpKeys.routine = 6
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

//struct Column6DataView_Previews: PreviewProvider {
//    static var previews: some View {
//        Column1DataView()
//    }
//}
