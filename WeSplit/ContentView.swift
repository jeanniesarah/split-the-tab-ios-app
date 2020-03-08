//
//  ContentView.swift
//  WeSplit
//
//  Created by JP on 2020-03-08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double((Int(numberOfPeople) ?? 0))
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Total bill amount"))  {
                    TextField("Enter bill amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Number of people")) {
                    TextField("Enter number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            
            }
                
            .navigationBarTitle("WeSplit", displayMode: .large)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
