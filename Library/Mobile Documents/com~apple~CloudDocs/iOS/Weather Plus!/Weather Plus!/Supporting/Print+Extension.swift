//
//  Print+Extension.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/25/21.
//

import SwiftUI

extension View {
	func Print(_ vars: Any...) -> some View {
		for v in vars { print(v) }
		return EmptyView()
	}
}

