//
//  Example04View.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/12/12.
//
import SwiftUI

struct UserView: View { // 사용자 추가 뷰
    @Binding var showUserView: Bool

    var body: some View {
        NavigationView {
            Text("사용자 추가 화면입니다.")
            .navigationBarTitle(Text("사용자 추가"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    print("consol : 완료버튼 눌림")
                    self.showUserView = false
                }) {
                    Text("완료").bold()
                })
        }
    }
}
//아직 사용하지 않음
/*
struct AlertView: View {
    @Binding var showUserView: Bool

    var body: some View {
        NavigationView {
            Text("알림 설정 화면입니다.")
            .navigationBarTitle(Text("알림 형태"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    print("consol : 완료버튼 눌림")
                    self.showUserView = false
                }) {
                    Text("완료").bold()
                })
        }
    }
}
*/

struct Example04View: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isAuto: Bool = true
    @State var notifivationEnabled: Bool = false
    @State private var bannerIndex = 0
    @State private var previewIndex = 0
    @State private var alertIndex = 0
    @State var showUserView = false // 사용자 추가 버튼 변수
    @State var selectedDate = Date()
    
    var bannerStyle = ["일시적 표시", "지속적 표시"]
    var previewOptions = ["항상", "잠겨있지 않을 때(기본)", "안 함"]
    var alertGroup = ["자동", "앱별로 정리", "끔"]
    
    var closedRange: ClosedRange<Date> { // DatePicker의 시간 범위 제한
            let today = Calendar.current.date(byAdding: .day, value: -2, to: Date())!
            let fiveDaysAgo = Calendar.current.date(byAdding: .day, value: -5, to: Date())!
            
            return fiveDaysAgo...today
        }
    
    var body: some View {
            Form {
                Section(header: Text("프로파일")) {
                    TextField("UserName", text: $username)
                    TextField("PassWord", text: $password)
                    Toggle(isOn: $isAuto) {
                        Text("Automatic Login")
                    }
                    DatePicker("생년월일", selection: $selectedDate, displayedComponents: .date)
                }
                Section(header: Text("알림")) {
                    Toggle(isOn: $notifivationEnabled) {
                        Text("알림 허용")
                    }
                    Picker(selection: $bannerIndex, label: Text("배너 스타일")) {
                        ForEach(0 ..< bannerStyle.count) {
                            Text(self.bannerStyle[$0])
                        }
                    }
                }
                Section(header: Text("옵션")) {
                    Picker(selection: $previewIndex, label: Text("미리보기 표시")) {
                        ForEach(0 ..< previewOptions.count) {
                            Text(self.previewOptions[$0])
                        }
                    }
                    Picker(selection: $alertIndex, label: Text("알림 그룹 설정")) {
                        ForEach(0 ..< alertGroup.count) {
                            Text(self.alertGroup[$0])
                        }
                    }
                    DatePicker("시간 설정", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                }

                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Text("0.0.1")
                    }
                }

                Section {
                    Button(action: {
                        print("consol : 리셋버튼 눌림")
                    }) {
                        Text("Reset")
                    }
                }
            }
            
        .navigationBarTitle(Text("설정"), displayMode: .inline)
            
        // 사용자 추가 버튼
        .navigationBarItems(trailing:
            Button(action: {
                self.showUserView.toggle()
                print("consol : 네비게이션 바 우측 버튼 눌림")
            }) {
                Image(systemName: "person.crop.circle.badge.plus")
                    .font(Font.system(.title))
            }
        ) // 네비게이션 바 우측에 버튼 추가
            .sheet(isPresented: $showUserView) {
                SheetView(showSheetView: self.$showUserView)
            }
    }
}



struct Example04View_Previews: PreviewProvider {
    static var previews: some View {
        Example04View()
    }
}
