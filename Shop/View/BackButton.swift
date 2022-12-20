

import SwiftUI

struct BackButton: View {
    
    var body: some View {
        
        Button(action: {
            Coordinator.pop()
        })
        {
            ZStack {
                Image("Rectangle")
                    .resizable()
                    .frame(width: 37, height: 37)
                    .foregroundColor(Color("Blue"))
                Image("Back")
                    .resizable()
                    .frame(width: 9, height: 16)
                    .foregroundColor(Color.white)
            }
        }
    }    
}



