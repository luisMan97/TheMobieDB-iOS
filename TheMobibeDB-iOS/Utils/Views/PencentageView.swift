//
//  PencentageView.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import SwiftUI

struct PencentageView: View {
    
    var percentage: CGFloat
    
    var body: some View {
        ZStack {
            Text("\(Int(percentage * 10))%")
                .font(.system(.caption, design: .rounded))
                .foregroundColor(.white)
                .bold()
            
            Circle()
                .stroke(Color.percentageGrayColor, lineWidth: 2)
                .frame(width: 35, height: 35)
            
            Circle()
                .trim(from: 0, to: percentage / 10)
                .stroke(Color.percetageGreenColor, lineWidth: 2)
                .frame(width: 35, height: 35)
                .rotationEffect(Angle(degrees: -90))
        }.padding(4)
        .background(Color.percentageBlueColor)
        .clipShape(Circle())
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
