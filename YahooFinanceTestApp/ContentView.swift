//
//  ContentView.swift
//  YahooFinanceTestApp
//
//  Created by Hoang Nguyen on 2/20/24.
//

import SwiftUI
import SwiftYFinance

struct ContentView: View {
    @State var textDisplay = "Hello Tien"
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(textDisplay)
        }
        .padding().onAppear(perform: {
            
            print("onAppear")
            
            SwiftYFinance.fetchSearchDataBy(searchTerm: "BYND", callback: {
                
                (result: [YFQuoteSearchResult ]?, error:  Error?) in
                
                if let someError = error {
                    textDisplay = "Got error " + someError.localizedDescription
                }else{
                    
                    if let someResult = result{
                        if someResult.count > 0{
                            
                            textDisplay = "Got result for " +  (someResult[0].longname ?? "some long name")
                            print("Got result back")
                        }
                       
                    }
          
                }
                
            })
        })
    }
}

#Preview {
    ContentView()
}
