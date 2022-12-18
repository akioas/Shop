

import SwiftUI

struct MyCartTopBar: View {
        
    var body: some View {
        HStack {
            Spacer()
            
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    BackButton()
                    
                    Spacer()
                    
                    Text("Add adress")
                    
                    Spacer()
                    
                    
                    Button(action: {
                        
                    })
                    {
                        Image(systemName: "drop")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                    }
                    
                    
                    Spacer()
                    
                }
                
                Text("My Cart")
                    .font(.largeTitle)
            }
            Spacer()    
        }
        
    }

}
