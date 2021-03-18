//
//  ContentView.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 2/10/21.
//

import Combine
import SwiftUI

struct ContentView: View {
	@State private var isShowing = false
	@StateObject var popUpKeys = Keys()
	@StateObject var forecastListVM = ForecastListVM()
	@Environment(\.colorScheme) var colorScheme // Dark or Light Mode
		
	var body: some View {
		ZStack {
			NavigationView {
				VStack {
	
// Stewart - this one works because it does not need to reference "day.xxx"
					UserInput()
					
					List(forecastListVM.forecasts, id: \.dayNumber) { day in
						VStack {
							Text(day.overview).fontWeight(.semibold)
								.frame(maxWidth: .infinity, alignment: .center)
								.background(Color.blue)
								.foregroundColor(.white)

// Stewart - I am not sure what to pass to the subview here...this obviously is not doing the job
//           If I remove this call, remove DateRectangle.swift from the project and replace
//             it with the view moved into DateRectangle struct it compiles.
							
							DateRectangle(day: forecastListVM.forecasts)
							
							HStack {
								VStack(alignment: .center) {
									Image(systemName: "thermometer.sun.fill")
										.renderingMode(.original)
										.frame(width: 30, alignment: .center)
										.padding(1)
										.onTapGesture(count: 1) {
											buildPopUp1(
												title: K.Title.high,
												desc: K.Desc.high,
												img: "thermometer.sun.fill",
												v1: day.high)
											isShowing = true
										}
									
									Image(systemName: "cloud.fill")
										.foregroundColor(.blue)
										.frame(width: 30, alignment: .center)
										.padding(1)
										.onTapGesture(count: 1) {
											buildPopUp2(
												title: K.Title.clouds,
												desc: K.Desc.clouds,
												img: "cloud.fill",
												foreClr: .blue,
												v1: day.clouds)
											isShowing = true
										}
									
									Image(systemName: "wind")
										.font(Font.title2.weight(.bold))
										.foregroundColor(.blue)
										.frame(width: 30, alignment: .center)
										.padding(1)
										.onTapGesture(count: 1) {
											buildPopUp5(
												title: K.Title.wind,
												desc: K.Desc.wind,
												img: "wind",
												foreClr: .blue,
												v1: day.wind,
												v2: day.windDir)
											isShowing = true
										}
									
									Image(systemName: "sunrise.fill")
										.font(Font.headline.weight(.bold))
										.foregroundColor(.yellow)
										.frame(width: 30, alignment: .center)
										.offset(y: -3)
										.padding(1)
										.onTapGesture(count: 1) {
											buildPopUp5(
												title: K.Title.sunrise,
												desc: K.Desc.sunrise,
												img: "sunrise.fill",
												foreClr: .yellow,
												v1: day.sunrise,
												v2: "")
											isShowing = true
										}
								}
								
								// Column 2
								VStack(alignment: .center) {
									Group {
										Text(day.high)
											.modifier(TextDisplayModifier())
										Text(day.clouds)
											.modifier(TextDisplayModifier())
										HStack {
											Text(day.wind)
											Text(day.windDir)
												.offset(x: -6)
												.font(.footnote)
										}
										.modifier(TextDisplayModifier())
										
										Text(day.sunrise)
											.modifier(TextDisplayModifier())
									}
								}
								
// Columns 3-6 removed to limit code to review...
								
							}
						}
					} // End of List View
					.listStyle(PlainListStyle())
				} // End of VStack
				.ignoresSafeArea(edges: [.leading, .trailing])
			}  // End of NavigationView
		} // End of ZStack
		.padding(.horizontal)
		.navigationTitle(K.navTitle)
	} // End of Body: some View
	
// Stewart - These routines work but likely not doing this the best or "correct" way?
//           My intention was to limit the parameters by putting all into a struct that is shared
//             with the routine being called when I set the "isShowing" to true the PopUpView gets called.
//             It is used to explain what each weather symbol means as well as proivide some education.
//             The education text is stored in the Constants file.
	
	func buildPopUp1(title: String, desc: String, img: String, v1: String) {
		popUpKeys.title = title
		popUpKeys.desc = desc
		popUpKeys.image = img
		popUpKeys.val1 = v1
		popUpKeys.val2 = ""
		popUpKeys.val3 = ""
		popUpKeys.val4 = 0.0
		popUpKeys.routine = 1
	}
	
	
	func buildPopUp2(title: String, desc: String, img: String,
						  foreClr: Color, v1: String) {
		popUpKeys.title = title
		popUpKeys.desc = desc
		popUpKeys.image = img
		popUpKeys.foreColor = foreClr
		popUpKeys.val1 = v1
		popUpKeys.val2 = ""
		popUpKeys.val3 = ""
		popUpKeys.val4 = 0.0
		popUpKeys.routine = 2
	}
	
	
	func buildPopUp3(title: String, desc: String, img: String,
						  foreClr: Color, v1: String) {
		popUpKeys.title = title
		popUpKeys.desc = desc
		popUpKeys.image = img
		popUpKeys.foreColor = foreClr
		popUpKeys.val1 = v1
		popUpKeys.val2 = ""
		popUpKeys.val3 = ""
		popUpKeys.val4 = 0.0
		popUpKeys.routine = 3
	}
	
	
	func buildPopUp4(title: String, desc: String, img: String,
						  foreClr: Color, v1: String, v2: String) {
		popUpKeys.title = title
		popUpKeys.desc = desc
		popUpKeys.image = img
		popUpKeys.foreColor = foreClr
		popUpKeys.val1 = v1
		popUpKeys.val2 = v2
		popUpKeys.val3 = ""
		popUpKeys.val4 = 0.0
		popUpKeys.routine = 4
	}
	
	
	func buildPopUp5(title: String, desc: String, img: String, foreClr: Color,
						  v1: String, v2: String) {
		popUpKeys.title = title
		popUpKeys.desc = desc
		popUpKeys.image = img
		popUpKeys.foreColor = foreClr
		popUpKeys.val1 = v1
		popUpKeys.val2 = v2
		popUpKeys.val3 = ""
		popUpKeys.val4 = 0.0
		popUpKeys.routine = 5
	}
	
	
	func buildPopUp6(title: String, desc: String, foreClr: Color, v1: String,
						  v2: String, v3: String, v4: Double) {
		popUpKeys.title = title
		popUpKeys.desc = desc
		popUpKeys.image = ""
		popUpKeys.foreColor = foreClr
		popUpKeys.val1 = v1
		popUpKeys.val2 = v2
		popUpKeys.val3 = v3
		popUpKeys.val4 = v4
		popUpKeys.routine = 6
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.preferredColorScheme(.dark)
	}
}

struct TextDisplayModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 70, alignment: .center)
			.padding(1)
	}
}
