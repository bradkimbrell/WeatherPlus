//
//  Column3SymbolsView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/18/21.
//

import SwiftUI

struct Column3SymbolsView: View {
	@State var popUpKeys = Keys()
	@State private var isShowing = false
	@Environment(\.colorScheme) var colorScheme // Dark or Light Mode
	let day: ForecastVM
	let dateFormatter = DateFormatter()
	init(day: ForecastVM) {
		dateFormatter.dateFormat = "E, MMM, d"
		self.day = day
	}
	
	var body: some View {
		VStack(alignment: .center) {
			
			Image(systemName: "thermometer.snowflake")
				.frame(width: 30, alignment: .center)
				.foregroundColor(colorScheme == .light ? .white : .blue)
				.padding(.bottom, 1)
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.low
					popUpKeys.desc = K.Desc.low
					popUpKeys.image = "thermometer.snowflake"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.low
					popUpKeys.routine = 2
					isShowing = true
				}
			
			Image("pctPrecip")
				.resizable()
				.scaledToFit()
				.font(Font.title.weight(.bold))
				.foregroundColor(.blue)
				.frame(width: 30, height: 25, alignment: .center)
				.padding(.bottom, 1)
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.precip
					popUpKeys.desc = K.Desc.precip
					popUpKeys.image = "pctPrecip"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.pop
					popUpKeys.routine = 3
					isShowing = true
				}
			
			Image("humidity2")
				.resizable()
				.scaledToFit()
				.frame(width: 30, height: 25, alignment: .center)
				.offset(x: 0, y: -2)
				.padding(.bottom, 1)
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.humidity
					popUpKeys.desc = K.Desc.humidity
					popUpKeys.image = "humidity2"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.humidity
					popUpKeys.routine = 3
					isShowing = true
				}
			
			Image(systemName: "sunset.fill")
				.font(Font.headline.weight(.bold))
				.foregroundColor(.orange)
				.frame(width: 30, alignment: .center)
				.offset(y: -4)
				.padding(.bottom, 1)
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

//struct Column3SymbolsView_Previews: PreviewProvider {
//    static var previews: some View {
//        Column1SymbolsView()
//    }
//}
