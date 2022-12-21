

import SwiftUI

struct ProductDetailsTopBar: View {
    
    @State var count = Repository.shared.basketItemsCount

    var body: some View {
        
        HStack {
            
            Spacer()
                .frame(width: 42)
            
            BackButton()
            
            Spacer()
                .frame(width: 51)
            
            Text("Product Details")
                .foregroundColor(Color("Blue"))
                .font(.custom("MarkPro-Medium", size: 18))
            
            Spacer()
            
            
            Button(action: {
                Coordinator.push(view: MyCartView())
            })
            {
                ZStack {
                    Image("Rectangle")
                        .resizable()
                        .frame(width: 37, height: 37)
                        .foregroundColor(Color("Orange"))
                    Image("Cart")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color.white)
                    VStack {
                        Spacer()
                            .frame(height: 2)
                        if (count ?? 0) > 0 {
                            Text(String(count ?? 0))
                                .foregroundColor(.white)
                                .font(.custom("MarkPro", size: 8))
                        }
                    }
                }
            }
            
            Spacer()
                .frame(width: 35)
        }
    }
}


