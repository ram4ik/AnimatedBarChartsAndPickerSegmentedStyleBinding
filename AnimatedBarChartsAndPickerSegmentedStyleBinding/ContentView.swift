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
    
    @State var dataPoints: [CGFloat] = [
        32, 42, 78
    ]
    
    var body: some View {
        ZStack {
           
            Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calory Intake")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                
                HStack(spacing: 16) {
                    BarView(value: dataPoints[pickerSelectedItem])
                    BarView(value: dataPoints[pickerSelectedItem])
                    BarView(value: dataPoints[pickerSelectedItem])
                    
                }.padding(.top, 24)
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
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text("D").padding(.top, 8)
        }
    }
}
