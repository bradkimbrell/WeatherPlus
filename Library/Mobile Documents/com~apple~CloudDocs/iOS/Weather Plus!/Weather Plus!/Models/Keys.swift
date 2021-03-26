//
//  Keys.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 3/5/21.
//

import SwiftUI

class Keys: ObservableObject {
	var title: String	= ""
	var desc: String		= ""
	var image: String	= ""
	var foreColor: Color = .white // Just for init purposes
	var routine: Int		= 1 // Which View to present in the popup
	var val1: String		= ""
	var val2: String		= ""
	var val3: String		= ""
	var val4: Double		= 0.0
	
//	init(title: String, desc: String, image: String, foreColor: Color, routine: Int,
//		  							val1: String, val2: String, val3: String, val4: Double) {
//		self.title = title
//		self.desc = desc
//		self.image = image
//		self.foreColor = foreColor
//		self.routine = routine
//		self.val1 = val1
//		self.val2 = val2
//		self.val3 = val3
//		self.val4 = val4
//	}
}

