//
//  ContentView.swift
//  weight-track
//
//  Created by George Alexandrov on 01.04.2021.
//

import SwiftUI
import CoreData
import SwiftUICharts

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
                            TextField("0.00 kg", text: $currentWeight).keyboardType(.numberPad)
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
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistentCloudKitContainer.persistentContainer.viewContext


        ContentView()
//            .environment(\.managedObjectContext, context)
    }
}
