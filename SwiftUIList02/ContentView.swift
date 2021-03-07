//
//  ContentView.swift
//  SwiftUIList02
//
//  Created by Mamoru Sugihara on 2021/03/07.
//

import SwiftUI

struct ContentView: View {
	var items = (0..<100)

	var body: some View {
		GeometryReader { geo in
			List(items) { n in
				ItemRow(index: n)
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

	var body: some View {
		GeometryReader { geo in
			ZStack {
				Color.blue.opacity(0.3)
				Text("Item: \(index)")
			}
			.scaleEffect(x: -1, y: 1)
			.contentShape(Rectangle())
			.onTapGesture {
				print("\(index)")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
