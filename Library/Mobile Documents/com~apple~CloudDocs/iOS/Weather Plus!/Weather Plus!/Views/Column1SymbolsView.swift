//
//  Column1SymbolsView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/18/21.
//

import SwiftUI

struct Column1SymbolsView: View {
	var popUpKeys = Keys()
	@State private var isShowing = false
	@Environment(\.colorScheme) var colorScheme // Dark or Light Mode
	
	let day: ForecastVM
	let dateFormatter = DateFormatter()
	init(day: ForecastVM) {
		dateFormatter.dateFormat = "E, MMM, d"
		self.day = day
	}
	
	
	var body: some View {
		VStack(alignment: .leading) { // was .center
			Image(systemName: "thermometer.sun.fill")
				.renderingMode(.original)
				.font(Font.callout.weight(.bold))
				.frame(width: 30, height: 25, alignment: .center) // added height modifier
				.padding(.bottom, 1)
				.onTapGesture {
					day.setClassToEmpty()
					popUpKeys.title = K.Title.high
					popUpKeys.desc = K.Desc.high
					popUpKeys.image = "thermometer.sun.fill"
					popUpKeys.val1 = day.high
					popUpKeys.routine = 1
					isShowing = true
				}
			
			Image(systemName: "cloud.fill")
				.modifier(Symbols())
				
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
			
			Image(systemName: "wind")
				.modifier(Symbols())
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
			
			Image(systemName: "sunrise.fill")
				.modifier(SymbolsYellow())
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

//struct Column1SymbolsView_Previews: PreviewProvider {
//    static var previews: some View {
//        Column1SymbolsView()
//    }
//}

