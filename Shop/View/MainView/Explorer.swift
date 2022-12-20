

import SwiftUI

struct Explorer: View {
        
    var body: some View {
        ZStack{
            Color("Blue")
            HStack(spacing: 0) {
                
                Spacer(minLength: 68.0)
                
                Text("•")
                    .fontWeight(.bold)
                    .font(.title)
                
                Text(" Explorer")
                    .font(.custom("MarkPro-Bold", size: 15))
                    .fontWeight(.bold)
                
                Spacer()

                Button(action: {
                    Coordinator.push(view: MyCartView())
                })
                {
                    Image("Cart")
                        .imageScale(.large)
                        .frame(width: 18.0, height: 17.6)
                }
                
                Spacer()
                
                Button(action: {})
                {
                    Image("Heart")
                        .imageScale(.large)
                        .frame(width: 19.0, height: 17.0)
                }
                
                Spacer()
                
                Button(action: {})
                {
                    Image("Person")
                        .imageScale(.large)
                        .frame(width: 17.6, height: 17.0)
                }
                
                Spacer(minLength: 67.0)

            }
        }
        .foregroundColor(.white)
        .frame(height: 72.0)
        .cornerRadius(10)
    }
    
}

struct Explorer_Previews: PreviewProvider {
    static var previews: some View {
        Explorer()
    }
}
