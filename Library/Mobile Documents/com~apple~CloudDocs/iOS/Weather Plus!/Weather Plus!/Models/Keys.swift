//
//  Keys.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 3/5/21.
//

import SwiftUI

class Keys: ObservableObject {
	var title: String = ""
	var desc: String = ""
	var image: String = ""
	var foreColor: Color = .white // Just for init purposes
	var routine: Int = 1 // Which View to present in the popup
	var val1: String = ""
	var val2: String = ""
	var val3: String = ""
	var val4: Double = 0.0
}
