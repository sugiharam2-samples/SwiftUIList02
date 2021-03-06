//
//  ContentView.swift
//  SwiftUIList02
//
//  Created by Mamoru Sugihara on 2021/03/07.
//

import SwiftUI

struct ContentView: View {
	@State var selected = 0

	var rot: Angle {
		get { return .degrees(Double(-selected * 10)) }
	}

	var body: some View {
		GeometryReader { geo in
			List(0..<100) { n in
				ZStack {
					Color.blue.opacity(0.3)
					Text("Item:\(n)")
				}
				.contentShape(Rectangle())
				.onAppear {
					print(n)
				}
				.onTapGesture {
					selected = n
				}
			}
			.rotationEffect(rot, anchor: .topLeading)
			.frame(width: geo.size.height, height: geo.size.width)
			.animation(.default)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
