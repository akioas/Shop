

import SwiftUI

struct BackButton: View {
    
    var body: some View {
        
        Button(action: {
            Coordinator.pop()
        })
        {
            Image(systemName: "chevron.left.square.fill")
                .resizable()
                .foregroundColor(Color("Blue"))
        }
        .frame(width: iconX, height: iconY)

    }
    
}


