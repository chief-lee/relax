//
//  relaxView.swift
//  relax
//
//  Created by 李锦 on 2020/11/20.
//

import SwiftUI

struct relaxView: View {
    @State var timeRemaining :Int = 30
//    @State var currentDate = ""
    @Environment(\.presentationMode) var presentationMode
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            VStack {
                Text("倒计时")
                    .font(.system(size: 128, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color.gray)
                Text("\(timeRemaining)")
                            .onReceive(timer) { input in
                                if self.timeRemaining > 0 {
                                                    self.timeRemaining -= 1
                                                }
                                else
                                {
                                    NSApp.hide(nil)
                                    timer.upstream.connect().cancel()
                                }
                                  
//                                self.currentDate = input
//                                let formatter3 = DateFormatter()
//                                formatter3.dateFormat = "HH:mm:ss"
//                                self.currentDate = formatter3.string(from: Date())
                            }
                    .font(.system(size: 88, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Text("让眼睛休息下，让头发少掉点")
                    .font(.system(size: 58, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.gray)
                    .padding()

                Button(action: {
                    NSApp.hide(nil)
                    timer.upstream.connect().cancel()
                }){
                    Text("我就不休息")
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))

                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                Spacer()
            }
        }
        .background(Color.black)
        .opacity(0.9)
    }
}

struct relaxView_Previews: PreviewProvider {
    static var previews: some View {
        relaxView()
    }
}
