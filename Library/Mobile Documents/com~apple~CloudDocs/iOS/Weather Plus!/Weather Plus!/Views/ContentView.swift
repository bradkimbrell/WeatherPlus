//
//  ContentView.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 2/10/21.
//

// Must be done before shipment!
// =========================================================================================
// iPhone 8 Simulator - only allows 1 character in the TextField for Location???
// New App Icon
// Test all graphics in Dark and Light modes (create light mode graphics / colors)
// Determine size of the "children in weather" images
// Name the App
// Create Screen Shots and explanation for App Store

// Future enhancements:
// =========================================================================================
// Add a Map button with a tabView
// Replace Buttons with custom
// Add custom Alert container
// Find resource for weather info to change each day ... educational, fun facts, etc.

import Combine
import SwiftUI

struct ContentView: View {
	@State var popUpKeys = Keys()
	@State var isShowing					= false
	@StateObject var forecastListVM	= ForecastListVM()
	@Environment(\.colorScheme) var colorScheme // Dark or Light Mode

	var body: some View {
		ZStack {
//			Color("BackgroundColor")
//				.ignoresSafeArea()
			NavigationView {
				VStack {
					Picker(selection: $forecastListVM.units, label: Text(K.units)) {
						Text(K.centigrade).tag(0)
						Text(K.farenheit).tag(1)
					}
					.pickerStyle(SegmentedPickerStyle())
					.frame(width: 100)
					.padding(.vertical)

					HStack {
						TextField(K.enterLoc, text: $forecastListVM.location, onCommit: {
							forecastListVM.getWeatherForecast()
						})
						.textFieldStyle(RoundedBorderTextFieldStyle())
						.font(.title2)
						
						.overlay(
							Button(action: {
								forecastListVM.location = ""
								forecastListVM.getWeatherForecast()
							}) {
								Image(systemName: "xmark.circle")
									.foregroundColor(.blue)
									.font(.title2)
							}
							.padding(.horizontal), alignment: .trailing
						)
						Button {
							forecastListVM.getWeatherForecast()
						} label: {
							Image(systemName: "magnifyingglass.circle.fill")
								.font(.title)
								.foregroundColor(Color.white)
						}
					}
					List(forecastListVM.forecasts, id: \.dayNumber) { day in
						VStack {
							WeatherSummaryView(day: day)
							HStack {
								DateRectangleView(day: day)
								Weather3DImageView(day: day) // 3-D Children Playing in Weather
							}
							HStack {
								Column1SymbolsView(day: day)
								Column2DataView(day: day)
								Column3SymbolsView(day: day)
								Column4DataView(day: day)
								Column5SymbolsView(day: day)
								Column6DataView(day: day)
							}
						}
						.frame(maxWidth: .infinity, maxHeight: .infinity)
						.background(Color("BackgroundColor"))
					}
					.listStyle(PlainListStyle())
//					.background(Color("BackgroundColor"))
				}
				.navigationTitle(K.navTitle)
//				.background(Color("BackgroundColor"))
			}
			.edgesIgnoringSafeArea(.all)
//			.background(Color("BackgroundColor"))
			
		}
		.alert(item: $forecastListVM.appError) { appAlert in
			Alert(title: Text("Error"),
				message: Text(
								"""
								\(appAlert.errorString)
								\(K.tryLater)
								""")
			)
		}
		
		// This .sheet modifier was included inside the Listview above
		// This hidden Text("") field allows attachment here curing the errors of
		//   "already presented" each time I called SymbolKeyVC due to it
		//   never being actually Dismissed
		
		Text("").hidden()
			.sheet(isPresented: $isShowing) {
				PopUpView(popUpKeys: popUpKeys, isPresented: $isShowing, onDismiss: {
					self.isShowing = false
				})
			}
		
		if forecastListVM.isLoading {
			ZStack {
				Color(.white)
					.opacity(0.3)
					.ignoresSafeArea()
				ProgressView(K.fetchWeather)
					.padding()
					.background(
						RoundedRectangle(cornerRadius: 10)
							.fill(Color(.systemBackground))
					)
					.shadow(radius: 10)
			}
		}
	} // End of Body: some View
	
	
} // End of Struct

//struct ContentView_Previews: PreviewProvider {
//	static var previews: some View {
//		ContentView()
//			.preferredColorScheme(.dark)
//	}
//}

