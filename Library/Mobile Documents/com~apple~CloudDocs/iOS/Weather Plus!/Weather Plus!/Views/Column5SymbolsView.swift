//
//  Column5SymbolsView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/18/21.
//

import SwiftUI

struct Column5SymbolsView: View {
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
			Image(systemName: "thermometer")
				.foregroundColor(colorScheme == .light ? .white : .blue)
				.frame(width: 30, height: 25, alignment: .center)
				.padding(.bottom, 1)
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.feels
					popUpKeys.desc = K.Desc.feels
					popUpKeys.image = "thermometer"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.getFeelsLikeByTime()
					popUpKeys.routine = 2
					isShowing = true
					isShowing = true
				}
			
			Image("dewPoint")
				.resizable()
				.scaledToFit()
				.font(Font.title2.weight(.bold))
				.frame(width: 30, height: 25, alignment: .center)
				.foregroundColor(.blue)
				.padding(.bottom, 1)
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.dew
					popUpKeys.desc = K.Desc.dew
					popUpKeys.image = "dewPoint"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.dewPoint
					popUpKeys.routine = 3
					isShowing = true
				}
			
			Image("barometricPressure")
				.resizable()
				.scaledToFit()
				.frame(width: 30, height: 30, alignment: .center) // was 30...25
				.padding(.bottom, 1)
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.baro
					popUpKeys.desc = K.Desc.baro
					popUpKeys.image = "barometricPressure"
					popUpKeys.foreColor = .blue
					popUpKeys.val1 = day.pressure
					popUpKeys.val2 = K.millibars
					popUpKeys.routine = 4
					isShowing = true
				}
			
			Image("uviForDark")
				.resizable()
				.scaledToFit()
				.frame(width: 30, height: 25, alignment: .center)
				.foregroundColor(day.getUVIColor())
				.offset(x: 0, y: -5)
				.padding(.bottom, 1)
				.onTapGesture {
					day.setClassToEmpty()
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

//struct Column5SymbolsView_Previews: PreviewProvider {
//    static var previews: some View {
//        Column1SymbolsView()
//    }
//}
