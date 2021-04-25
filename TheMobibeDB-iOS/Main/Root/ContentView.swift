//
//  ContentView.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 23/04/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var managedContext
    
    init() {
        UINavigationBar().setup(backgroundColor: .primaryColor)
    }
    
    var body: some View {
        MoviesBuilder.createModule()
        /*LyricsSearchBuilder.createModule(managedContext: managedContext)
            .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
