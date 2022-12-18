

import SwiftUI


struct SelectCategory: View {
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Select Category")
                    .font(.custom("MarkPro-Bold", size: 30))
                
                Spacer()
                
                Text("view all")
                    .foregroundColor(Color("Orange"))
                
            }
            
            ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(0..<5) { index in
                                VStack {
                                    Text("\(index)")
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(Color("Orange"))
                                        .cornerRadius(50)
                                        .font(.largeTitle)
                                    Text("\(index)")
                                }
                            }
                        }
                    }
            
        }
        
    }
    
}
