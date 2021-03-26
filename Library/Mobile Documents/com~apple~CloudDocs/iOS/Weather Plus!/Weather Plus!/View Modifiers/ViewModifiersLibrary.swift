//
//  ViewModifiersLibrary.swift
//  Weather Plus!
//
//  Created by Brad Kimbrell on 3/20/21.
//

import SwiftUI

struct TextStandard: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 75, alignment: .center)
			.padding(.bottom, 1)
			.foregroundColor(.white)
	}
}


struct TextSmall: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 65, alignment: .center)
			.padding(.bottom, 1)
			.foregroundColor(.white)
	}
}

struct Symbols: ViewModifier {
	@Environment(\.colorScheme) var colorScheme // Dark or Light Mode
	func body(content: Content) -> some View {
		content
			.font(Font.title2.weight(.bold))
			.foregroundColor(colorScheme == .light ? .white : .blue)
			.frame(width: 30, alignment: .center)
			.padding(.bottom, 1)
	}
}

struct SymbolsYellow: ViewModifier {
	@Environment(\.colorScheme) var colorScheme // Dark or Light Mode
	func body(content: Content) -> some View {
		content
			.font(Font.headline.weight(.bold))
			.foregroundColor(.yellow)
			.frame(width: 30, alignment: .center)
			.padding(.bottom, 1)
	}
}
