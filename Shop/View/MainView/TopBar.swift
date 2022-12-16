

import SwiftUI

struct TopBar: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Image(systemName: "location")
                .foregroundColor(Color("Orange"))
            
            Text("Zihuatanejo, Gro")
            
            Image(systemName: "chevron.down")
            
            Spacer()
            
            Button(action: {
                isShowing.toggle()
            }){
                Image(systemName: "arrowtriangle.down.fill")
            }
            
        }
        
    }
    //download

}
