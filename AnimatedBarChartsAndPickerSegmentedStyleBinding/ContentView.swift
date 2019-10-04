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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
