//
//  ContentView.swift
//  weight-track
//
//  Created by George Alexandrov on 01.04.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("Weight")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistentCloudKitContainer.persistentContainer.viewContext


        ContentView().environment(\.managedObjectContext, context)
    }
}
