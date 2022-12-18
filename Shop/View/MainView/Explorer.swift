

import SwiftUI

struct Explorer: View {
        
    var body: some View {
        ZStack{
            Color("Blue")
            HStack(spacing: 0) {
                
                Spacer(minLength: 68.0)
                
                Text("•")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.title)
                
                Text(" Explorer")
                    .foregroundColor(Color.white)
                    .font(.custom("MarkPro-Bold", size: 15))
                    .fontWeight(.bold)
                
                Spacer()

                Button(action: {
                    Coordinator.push(view: MyCartView())
                })
                {
                    Image("Cart")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .frame(width: 18.0, height: 17.6)
                }
                
                Spacer()
                
                Button(action: {})
                {
                    Image("Heart")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .frame(width: 19.0, height: 17.0)
                }
                
                Spacer()
                
                Button(action: {})
                {
                    Image("Person")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .frame(width: 17.6, height: 17.0)
                }
                
                Spacer(minLength: 67.0)

            }
        }
        .frame(height: 72.0)
        .cornerRadius(viewRadius)
    }
    
}

struct Explorer_Previews: PreviewProvider {
    static var previews: some View {
        Explorer()
    }
}
