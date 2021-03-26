//
//  GaugeProgressView.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/17/21.
//
// Draw Circular Gauge with a Gradient of the 5 colors of the UVI Scale
// From Paul Hudson's SwiftUI Views Mastery book - I adapted the size to meet my needs.

import SwiftUI

struct GaugeProgressViewStyle: ProgressViewStyle {
	@State var popUpKeys: Keys
	
	let ag = AngularGradient(gradient: Gradient(colors: [.green, .yellow, .orange, .red, .purple]),
									center: .center,
									startAngle: .degrees(-5),
									endAngle: .degrees(270))
	
	func makeBody(configuration: Configuration) -> some View {
		let percent = Double(configuration.fractionCompleted ?? 1)
		
		return
			GeometryReader { gp in
				ZStack {
					Circle()
						.trim(from: 0.0, to: 0.8)
						.stroke(ag, style: StrokeStyle(
													lineWidth: 20, lineCap: CGLineCap.round))
						.rotationEffect(.degrees(125))
					HStack {
						// Manually display the legend of the top, middle and high ends of the scale
						Text("1.0").offset(x: -30, y: 60).foregroundColor(.green)
						Text("6.0").offset(x: 1, y: -85).foregroundColor(.orange)
						Text("12+").offset(x: 41, y: 60).foregroundColor(.purple)
					}
					.font(.body)
					.foregroundColor(.white)
					
					Circle()
						.strokeBorder(Color.black, lineWidth: 19 / 2)
						.frame(width: 19, height: 19)
						.offset(y: gp.size.height / 2 - (19/2))
						// Extent of rotation is 35 to 325 = 290 degrees =
						//    70 degrees removed for legend
						.rotationEffect(.degrees((70 / 2) + (290 * percent)),
																					anchor: .center)
					
					Text("\(String(popUpKeys.val4))")
						.font(Font.system(.title, design: .rounded).weight(.bold))
					
					configuration.label
						.font(Font.system(.title2, design: .rounded).weight(.bold))
						.frame(width: 50)
						.lineLimit(2)
						.offset(y: 60)
				}
				.padding(10)
				.frame(width: min(gp.size.height, gp.size.width),
													height: min(gp.size.height, gp.size.width))
			}
	}
}
