//
//  ContentView.swift
//  Shared
//
//  Created by AKADA TEPPEI on 2020/12/09.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var searchBar = SearchBar()

    var body: some View {
        NavigationView {
            GeometryReader { g in
                ZStack(alignment: .top) {
                    Color(UIColor.secondarySystemBackground)
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(.vertical) {
                        VStack(alignment:.leading) {
                            VStack(alignment:.leading, spacing: 20) {
                                InlineButton(
                                    leftButton:MyButton(iconImage: Image(systemName: "calendar.circle.fill"), iconColor: .blue, title: "今日", numberOfReminders: 0),
                                    rightButton: MyButton(iconImage: Image(systemName: "calendar.circle.fill"), iconColor: .red, title: "日時変更あり", numberOfReminders: 0))
                                MyButton(iconImage: Image(systemName: "calendar.circle.fill"), iconColor: .gray, title: "すべて", numberOfReminders: 0)
                            }
                            .padding([.top, .leading, .trailing], 20)

                            MyList()
                                .frame(width: g.size.width , height: g.size.height, alignment: .leading)
                        }
                    }
                }
                .add(self.searchBar)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
}

struct MyList: View {
    var body: some View {
        List {
            Section(
                header: Text("マイリスト")
                        .font(.system(size: 24))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.leading)
                        .foregroundColor(.black)
            ) {
                MyListRow(title: "hoge", numberOfReminders: 1)
                MyListRow(title: "hoge", numberOfReminders: 1)
                MyListRow(title: "hoge", numberOfReminders: 1)
                MyListRow(title: "hoge", numberOfReminders: 1)
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct MyListRow: View {
    var title: String
    var numberOfReminders: Int

    var body: some View {
        HStack {
            Image(systemName: "list.bullet")
                .font(Font.system(size: 16, weight: .bold))
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(Circle().foregroundColor(.blue))


            Text(title)
            NavigationLink(destination: ContentView()) {
                Spacer()
                Text(String(numberOfReminders))
            }
        }
    }
}

struct InlineButton: View {
    let leftButton: MyButton
    let rightButton: MyButton

    var body: some View {
        HStack(spacing: 20) {
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
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
            }
            .padding(10)
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
