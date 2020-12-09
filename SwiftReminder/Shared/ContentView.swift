//
//  ContentView.swift
//  Shared
//
//  Created by AKADA TEPPEI on 2020/12/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {print("button pressed")}) {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Image(systemName: "calendar.circle.fill")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                    Spacer()
                    Text("0")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                Text("Today")
                    .foregroundColor(Color.gray)
            }

        }.frame(width: 100, height: 60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
