

import SwiftUI

struct MyCartTopBar: View {
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                    .frame(width: 42)
                
                BackButton()
                
                Spacer()
                
                Text("Add address")
                    .foregroundColor(Color("Blue"))
                    .font(.custom("MarkPro-Medium", size: 15))
                
                Spacer()
                    .frame(width: 9)
                
                Button(action: {
                    Coordinator.push(view: MyCartView())
                })
                {
                    ZStack {
                        Image("Rectangle")
                            .resizable()
                            .frame(width: 37, height: 37)
                            .foregroundColor(Color("Orange"))
                        Image("Location")
                            .resizable()
                            .frame(width: 14, height: 18)
                            .foregroundColor(Color.white)
                        
                    }
                }
                
                Spacer()
                    .frame(width: 46)
            }
        }
        Spacer()
            .frame(height: 50)
        
        HStack {
            Spacer()
                .frame(width: 42)
            
            Text("My cart")
                .foregroundColor(Color("Blue"))
                .font(.custom("MarkPro-Bold", size: 35))
            
            Spacer()
            
        }
        
    }
}


