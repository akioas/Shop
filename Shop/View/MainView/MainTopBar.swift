

import SwiftUI

struct MainTopBar: View {
    
    @Binding var isShowing: Bool
    private let location = "Zihuatanejo, Gro"
    
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 0) {
                
                Spacer()
                Button(action: {}) {
                    Image("Location")
                        .foregroundColor(Color("Orange"))
                        .frame(width: 12.0, height: 15.3)
                }
                Spacer()
                    .frame(width: 11)
                
                Text(location)
                    .font(.custom("MarkPro-Medium", size: 15))
                    .foregroundColor(Color("Blue"))
                
                Spacer()
                    .frame(width: 8)
                Button(action: {}) {
                    Image("Chevron")
                        .foregroundColor(Color(hex: "#B3B3B3"))
                        .frame(width: 10.0, height: 5.0, alignment: .top)
                }
                
                Spacer()
                
            }
            HStack {
                Spacer()
                Button(action: {
                    isShowing.toggle()
                }){
                    Image("Filter")
                        .frame(width: 11.0, height: 13.0)
                        .foregroundColor(Color("Blue"))
                }
                Spacer()
                    .frame(width: 18)
            }
        }
    }
}

