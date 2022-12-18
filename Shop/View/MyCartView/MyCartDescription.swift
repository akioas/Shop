import SwiftUI


struct MyCartDescription: View {
    
    @Binding var data: MyCartData?
    @Binding var basketCount: [Int : Int]
    
    var body: some View {
        
        ZStack {
            
            Color("Blue")
            VStack {
                
                if let data = data {
                    if let basket = data.basket {
                        
                        ForEach(basket, id: \.id) { item in
                            HStack {
                                
                                CachedImage(url: URL(string: item.images))
                                    .frame(width: 100)
                                
                                VStack {
                                    Text(item.title)
                                    Text("$" + String(item.price))
                                    
                                }
                                VStack {
                                    Text("-")
                                    Text(String(basketCount[item.id] ?? 1))
                                    Text("+")
                                }
                                
                            }
                            .frame(height: 100)
                            Spacer()
                        }
                        Spacer()
                    }
                        
                    
                    
                    Spacer()
                    HStack {
                        Text("Total")
                        Spacer()
                        Text(String(data.total))
                    }
                    HStack {
                        Text("Delivery")
                        Spacer()
                        Text(data.delivery)
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("Orange"))
                            .cornerRadius(15)
                        Text("Checkout")
                    }
                    .frame(height: 100)
                }
                
            }                            .foregroundColor(Color(.white))

        }
    }
}
