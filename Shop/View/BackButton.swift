

import SwiftUI

struct BackButton: View {
    
    var body: some View {
        
        Button(action: {
            Coordinator.pop()
        })
        {
            Image(systemName: "arrow.left")
                .foregroundColor(.green)
            
        }
        
    }
    
}



