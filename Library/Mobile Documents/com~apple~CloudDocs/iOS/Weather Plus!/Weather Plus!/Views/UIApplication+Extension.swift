//
//  UIApplication+Extension.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 2/17/21.
//

import UIKit

extension UIApplication {
	func endEditing() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
