//
//  ContentView.swift
//  AnimatedBarChartsAndPickerSegmentedStyleBinding
//
//  Created by ramil on 04/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        [132, 142, 178, 112, 42, 78, 189],
        [62, 113, 125, 113, 142, 118, 89],
        [123, 27, 196, 92, 42, 78, 189],
        [132, 142, 78, 192, 192, 178, 89],
        [62, 113, 125, 132, 182, 78, 189],
        [123, 172, 119, 32, 142, 178, 89],
        [23, 127, 96, 100, 142, 78, 189]
    ]
    
    var body: some View {
        ZStack {
           
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calory Intake")
                    .foregroundColor(Color("appFrontground"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                
                HStack(spacing: 16) {
                    BarView(value: dataPoints[pickerSelectedItem][0], day: "Su")
                    BarView(value: dataPoints[pickerSelectedItem][1], day: "M")
                    BarView(value: dataPoints[pickerSelectedItem][2], day: "T")
                    BarView(value: dataPoints[pickerSelectedItem][3], day: "W")
                    BarView(value: dataPoints[pickerSelectedItem][4], day: "T")
                    BarView(value: dataPoints[pickerSelectedItem][5], day: "F")
                    BarView(value: dataPoints[pickerSelectedItem][6], day: "Sa")
                    
                }.padding(.top, 24)
                    .animation(.default)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BarView: View {
    
    var value: CGFloat
    var day: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(day).padding(.top, 8)
            .foregroundColor(Color("appFrontground"))
        }
    }
}
