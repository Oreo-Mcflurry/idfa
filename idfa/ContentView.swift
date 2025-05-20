//
//  ContentView.swift
//  idfa
//
//  Created by yooinho on 5/20/25.
//

import SwiftUI
import AdSupport
import AppTrackingTransparency

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button {
                let idfa = ASIdentifierManager.shared().advertisingIdentifier

                // 콘솔에 출력
                print("IDFA: \(idfa.uuidString)")
            } label: {
                Text("Test")
            }
            
            Button {
                ATTrackingManager.requestTrackingAuthorization { status in
                           DispatchQueue.main.async {
                               switch status {
                               case .authorized:
                                   // 허용된 경우 IDFA 반환
                                   let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                                  print("IDFA: \(idfa)")
                               case .denied, .restricted, .notDetermined:
                                   break
                               @unknown default:
                                  break
                               }
                           }
                       }
            } label: {
                Text("Request Tracking")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
