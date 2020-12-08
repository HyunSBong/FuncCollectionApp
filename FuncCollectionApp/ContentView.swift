//
//  ContentView.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/11/20.
//

import SwiftUI

//struct는 class 처럼 함수를 가질 수도 있지만 protocol 상속이 가능하다.
// protocol을 상속한다면 변수나 함수도 구현해야한다(Interface과 같은 개념)


struct ContentView: View {
    // some 키워드는 제네릭으로 이해하면 편하다.
    var body: some View {
    // 다음 View로 넘어가기 ( 이벤트 처리 )
    // View를 함수나 배열에서 사용하려면 AnyView(뷰객체)를 사용하면된다.
    struct menuScrollView {
        var ID = UUID() // 고유 식별자
        var title : String
        var obj : AnyView // 뷰 객체
    }
    
    let menu : [menuScrollView] = [
        menuScrollView (title : "1. 텍스트 표시하기", obj : AnyView(Example01View())),
        menuScrollView (title: "2. Picker 구현하기", obj: AnyView(Example02View())),
        menuScrollView (title: "3. TabView 구현하기", obj: AnyView(Example03View())),
        menuScrollView (title: "4. 준비중", obj: AnyView(Example04View())),
        menuScrollView (title: "5. 준비중", obj: AnyView(Example05View()))
    ]
    // 배열을 받아서 출력하기
    return NavigationView {
        // VStack은 Android의 버티컬 속성을 가진 LinearLayout과 같은 기능을 한다.
        // ViewBuilder는 클로져의 복잡성 문제로 extra parameter call 에러가 발생한다.
        // 10개 이상의 View를 추가할 경우 발생한다.
        // 그럴 경우, View를 그룹단위(Group을 사용하거나 다른 View 안으로 그룹화)로 분리해야한다.
        VStack(alignment: .leading) {
            List(menu, id : \.title) {
                n in
                NavigationLink(destination: n.obj) {
                    Text(n.title)
                }.padding(.all,4.0)
            }
        }
        .navigationTitle("FunctionCollection")
    }
    }
    
}

// 함수의 정의는 파이썬과 비슷하게 func을 붙여 정의한다.
// 함수의 파라메터는 ( 이름 : 타입 ) 형식으로 지정해야하며 리턴타입은 -> 으로 지정한다.

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
