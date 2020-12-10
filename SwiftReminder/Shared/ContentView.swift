//
//  ContentView.swift
//  Shared
//
//  Created by AKADA TEPPEI on 2020/12/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color(UIColor.secondarySystemBackground)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 16) {
                InlineButton(
                    leftButton:MyButton(iconImage: Image(systemName: "calendar.circle.fill"), iconColor: .blue, title: "今日", numberOfReminders: 0),
                    rightButton: MyButton(iconImage: Image(systemName: "calendar.circle.fill"), iconColor: .red, title: "日時変更あり", numberOfReminders: 0))
                MyButton(iconImage: Image(systemName: "calendar.circle.fill"), iconColor: .gray, title: "すべて", numberOfReminders: 0)
            }
            .padding(16)
        }
    }
}

struct InlineButton: View {
    let leftButton: MyButton
    let rightButton: MyButton

    var body: some View {
        HStack(spacing: 16) {
            leftButton
            rightButton
        }
    }
}

struct MyButton: View {
    let iconImage: Image
    let iconColor: Color
    let title: String
    let numberOfReminders: Int

    var body: some View {
        Button(action: {print("button pressed")}) {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    iconImage
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .accentColor(iconColor)
                    Spacer()
                    Text(String(numberOfReminders))
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
            }
            .padding(8)
        }
        .background(Color.white)
        .cornerRadius(8)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
