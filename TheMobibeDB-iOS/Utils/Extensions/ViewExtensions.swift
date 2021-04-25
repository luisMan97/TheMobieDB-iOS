//
//  ViewExtensions.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import SwiftUI

extension View {
    
    func add(_ searchBar: SearchBar) -> some View {
        self.modifier(SearchBarModifier(searchBar: searchBar))
    }
}
