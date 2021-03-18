//
//  UserInput.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 3/14/21.
//

import SwiftUI

struct UserInput: View {
	@StateObject var forecastListVM = ForecastListVM()
	
    var body: some View {
		
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
				.padding(.horizontal),
				alignment: .trailing
			)
			Button {
				forecastListVM.getWeatherForecast()
			} label: {
				Image(systemName: "magnifyingglass.circle.fill")
					.font(.title)
			}
		}
    }
}

struct UserInput_Previews: PreviewProvider {
    static var previews: some View {
        UserInput()
    }
}
