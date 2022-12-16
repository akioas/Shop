

import SwiftUI

struct Explorer: View {
    
    
    var body: some View {
        ZStack{
            Color("Blue")
            HStack {
                
                Button(action: {
                    Coordinator.push(view: MyCartView())
                })
                {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
    
}


