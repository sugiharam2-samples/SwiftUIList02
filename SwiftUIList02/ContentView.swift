//
//  ContentView.swift
//  SwiftUIList02
//
//  Created by Mamoru Sugihara on 2021/03/07.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack {
			ItemList(items: (0..<100))
				.frame(height: 100)
			ItemList(items: (500..<600))
			ItemList(items: (1000..<1100))
		}
	}
}

struct ItemList: View {
	@State var items: Range<Int>

	var body: some View {
		GeometryReader { geo in
			List(items) { n in
				ItemRow(index: n)
					.frame(height: 100)
					.contentShape(Rectangle())
			}
			.frame(width: geo.size.height, height: geo.size.width)
			.rotationEffect(.degrees(-90), anchor: .bottomLeading)
			.transformEffect(.init(translationX: geo.size.width, y: 0))
			.scaleEffect(x: 1, y: -1)
		}
	}
}

struct ItemRow: View {
	@State var index = 0
	@State var check = false

	var body: some View {
		GeometryReader { geo in
			ZStack {
				Color.blue.opacity(check ? 0.5 : 0.3)
					.cornerRadius(8)
				Text("\(index)")
			}
			.frame(width: geo.size.height, height: geo.size.width)
			.rotationEffect(.degrees(90), anchor: .topTrailing)
			.transformEffect(.init(translationX: 0, y: geo.size.height))
			.scaleEffect(x: -1, y: 1)
			.onTapGesture {
				print("\(index)")
				check.toggle()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
