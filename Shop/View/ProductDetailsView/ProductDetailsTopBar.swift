

import SwiftUI

struct ProductDetailsTopBar: View {
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            BackButton()
            
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
