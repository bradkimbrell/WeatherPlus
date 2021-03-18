//
//  PopUpView.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 3/5/21.
//

import SwiftUI

struct PopUpView: View {
	@ObservedObject var popUpKeys: Keys
	@Binding var isPresented: Bool
	var onDismiss: () -> () // Allows the onDismiss in the calling ContentView() to work.
	
	var body: some View {
		ZStack {
			VStack(spacing: 15) {
				Text(popUpKeys.title)
					.font(Font.title.weight(.medium))
			
				switch popUpKeys.routine {
					case 1: // High and Low Temps
						HStack {
							Image(systemName: popUpKeys.image)
								.renderingMode(.original)
								.font(Font.title.weight(.bold))
								.frame(width: 80, height: 80, alignment: .center)
							Text(popUpKeys.val1)
								.font(Font.title.weight(.bold))
								.frame(width: 110, height: 80, alignment: .center)
						}
						
					case 2: // Clouds, POP, Sunset, Feels Like
						HStack {
							Image(systemName: popUpKeys.image)
								.font(Font.largeTitle.weight(.bold))
								.foregroundColor(popUpKeys.foreColor)
								.frame(width: 80, height: 80, alignment: .center)
							Text(popUpKeys.val1)
								.font(Font.title.weight(.bold))
								.frame(width: 110, height: 80, alignment: .center)
						}
						
					case 3: // Humidity & Dew Point
						HStack {
							Image(popUpKeys.image)
								.resizable()
								.scaledToFit()
								.frame(width: 80, height: 80, alignment: .center)
							Text(popUpKeys.val1)
								.font(Font.title.weight(.bold))
								.frame(width: 110, height: 80, alignment: .center)
						}
						
					case 4: // Barometric Pressure
						HStack {
							Group {
								Image(popUpKeys.image)
									.resizable()
									.scaledToFit()
									.frame(width: 80, height: 80, alignment: .center)
								Text(popUpKeys.val1)
									.font(Font.title.weight(.bold))
									.frame(width: 110, height: 80, alignment: .center)
								Text(popUpKeys.val2)
									.offset(x: -20)
									.font(.body)
									.frame(width: 40, height: 80, alignment: .leading)
							}
						}
						
					case 5: // Wind & Sunrise
						HStack {
							Group {
								Image(systemName: popUpKeys.image)
									.font(Font.largeTitle.weight(.bold))
									.foregroundColor(popUpKeys.foreColor)
									.frame(width: 80, height: 80, alignment: .center)
								
								HStack {
									Text(popUpKeys.val1)
										.font(Font.title.weight(.bold))
									Text(popUpKeys.val2)
										.font(Font.title3.weight(.regular))
								}
								.frame(width: 110, height: 80, alignment: .center)
							}
						}
						
					case 6: // UVI
						Group {
							VStack {
								Text("")
									.offset(y: -5)
									.font(.caption2)
									.padding(1)
								
								ProgressView("UVI", value: popUpKeys.val4 / 12)
									.progressViewStyle(GaugeProgressViewStyle(popUpKeys: popUpKeys))
									.frame(width: 150, height: 150)
									.font(.title)
							}
							.foregroundColor(popUpKeys.foreColor)
							
							Text(popUpKeys.val2) // Danger Level of UVI at this level
								.font(Font.title.weight(.bold))
								.foregroundColor(popUpKeys.foreColor)
							
							Text(popUpKeys.val3) // Danger text related to this UVI level
								.foregroundColor(popUpKeys.foreColor)
								.multilineTextAlignment(.center)
								.padding(.horizontal)
						}
					default:
						Image(systemName: popUpKeys.image)
							.renderingMode(.original)
							.frame(width: 60, alignment: .center)
				}
				Text(popUpKeys.desc)
					.multilineTextAlignment(.center)
					.padding(.horizontal)
					.padding(5)
				
				Button(action: {
					isPresented = false
				}) {
					Text(K.tapToDismiss)
						.font(.title3)
						.padding(EdgeInsets(top: 12, leading: 20, bottom: 12,
												  										trailing: 20))
						.foregroundColor(.white)
						.background(Color.blue)
						.cornerRadius(10)
				}
			}
			// val3 is only populated by the UVI property
			.frame(
				width: popUpKeys.val3 != "" ? 365 : 325,
				height: popUpKeys.val3 != "" ? 800 : 420,
				alignment: .center
			)
			.background(Color.black)
			.foregroundColor(.white)
			.padding(5)
			.border(Color.blue, width: 4)
		}
	}
}

