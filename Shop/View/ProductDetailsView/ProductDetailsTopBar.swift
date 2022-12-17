

import SwiftUI

struct ProductDetailsTopBar: View {
        
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Button(action: {
                Coordinator.pop()
            })
            {
                Image(systemName: "arrow.left")
                    .foregroundColor(.green)
                
            }
            
            Spacer()
            
            Text("Product Details")
                        
            Spacer()
            
            
            Button(action: {
                Coordinator.push(view: MyCartView())
            })
            {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            
            
            Spacer()
            
        }
        
    }

}
