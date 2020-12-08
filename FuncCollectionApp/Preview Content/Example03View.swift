//
//  Example03View.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/11/20.
//

import SwiftUI

struct Example03View: View {
    var body: some View {
        
        NavigationView {
            TabView {
                FirstView()
                    .tabItem {
                        Image(systemName: "text.justify")
                        Text("1")
                    }
                SecondView()
                    .tabItem {
                        Image(systemName: "folder")
                        Text("2")
                    }
                ThirdView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("3")
                    }
                Text("객체 없이 텍스트로만 구현된 탭")
                    .tabItem {
                        Image(systemName: "tray")
                        Text("None")
                    }
            }
        }.navigationTitle("3. TabView 구현하기")
    }
}

struct FirstView : View {
    var body : some View {
        ZStack {
            Text("텍스트 표시")
        }
    }
}

struct SecondView : View {
    var body: some View {
        ZStack {
            List {
                ForEach(0 ..< 200, id: \.self)
                {
                    i in Text("\(i)")
                }
            }
        }
    }
}

struct ThirdView : View {
    var body : some View {
        ZStack {
            Text("그리기 준비중")
        }
    }
}

struct Example03View_Previews: PreviewProvider {
    static var previews: some View {
        Example03View()
    }
}
