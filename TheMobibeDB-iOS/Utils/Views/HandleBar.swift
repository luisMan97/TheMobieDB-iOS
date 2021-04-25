//
//  HandleBar.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import SwiftUI

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 40, height: 6)
            .foregroundColor(Color(.handlebarGrayColor))
            .cornerRadius(8)
    }
}
