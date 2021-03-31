//
//  ContentView.swift
//  weight-track
//
//  Created by George Alexandrov on 01.04.2021.
//

import SwiftUI
import CoreData
import SwiftUICharts
import SwiftUIKeyboardHost
import Combine

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
    @State var currentWeight: String = ""

    var body: some View {
        NavigationView {
            VStack {
                LineView(data: [0], title: "Last month")
                    .padding()
                HStack {
                    VStack{
                        HStack {
                            TextField("0.00 kg", text: $currentWeight).keyboardType(.decimalPad)
                                .onReceive(Just(currentWeight)) { newValue in
                                     var filtered = newValue.filter {
                                        "0123456789,.".contains($0)
                                     }
                                    var decimalMet = false
                                    for i in 0..<filtered.count{
                                        if i == 0 && filtered[String.Index(encodedOffset: i)] == "0" {
                                            filtered.remove(at: String.Index(encodedOffset: i))
                                            continue
                                        }
                                        if filtered[String.Index(encodedOffset: i)] == "," {
                                            if decimalMet {
                                                filtered.remove(at: String.Index(encodedOffset: i))
                                            }
                                            decimalMet = true
                                        }
                                    }
                                     if filtered != newValue {
                                         self.currentWeight = filtered
                                     }
                                }
                            Button(action: {}) {
                                Image(systemName: "chevron.right")
                            }
                        }
                    }.padding()
                    .padding(.vertical, 10)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color(UIColor.secondarySystemFill)))
                    .padding()
                    Spacer()
                    VStack {
                        Text("Your goal").foregroundColor(Color.gray)
                    Text("0.00 kg")
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color(UIColor.secondarySystemFill)))
                    .padding()
                }
            }.navigationTitle("Weight")
        }
        .background(SwifUIDismissKeyboard())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistentCloudKitContainer.persistentContainer.viewContext


        ContentView()
//            .environment(\.managedObjectContext, context)
    }
}
