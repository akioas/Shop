import SwiftUI


struct MyCartDescription: View {
    
    @Binding var data: MyCartData?
    @Binding var basketCount: [Int : Int]
    let viewColor = Color(hex: "#282843")
    let currency = "$"
    
    var body: some View {
        
        ZStack {
            
            Color("Blue")
                .cornerRadius(30)
            VStack(spacing: 0) {
                
                Spacer()
                    .frame(height: 20)
                
                ScrollView(.vertical) {
                    
                    if let data = data {
                        if let basket = data.basket {
                            
                            ForEach(basket, id: \.id) { item in
                                Spacer()
                                    .frame(height: 20)
                                
                                HStack {
                                    
                                    Spacer()
                                        .frame(width: 23)
                                    
                                    CachedImage(url: URL(string: item.images))
                                        .frame(width: 88, height: 88)
                                        .cornerRadius(10)
                                    
                                    Spacer()
                                        .frame(width: 17)
                                    
                                    VStack {
                                        VStack {
                                            Spacer()
                                            
                                            HStack {
                                                
                                                Text(item.title)
                                                    .foregroundColor(Color(.white))
                                                    .font(.custom("MarkPro-Medium", size: 20))
                                                    .lineLimit(2, reservesSpace: true)
                                                
                                                Spacer()
                                            }
                                            
                                            
                                        }
                                        Spacer()
                                            .frame(height: 6)
                                        HStack {
                                            Text(currency + String(format: "%.2f", Double(item.price)))
                                                .foregroundColor(Color("Orange"))
                                                .font(.custom("MarkPro-Medium", size: 20))
                                            Spacer()
                                        }
                                        Spacer()
                                            .frame(height: 12)
                                    }
                                    VStack(spacing: 8) {
                                        Spacer()
                                        ZStack {
                                            viewColor
                                                .cornerRadius(13)
                                            
                                            VStack(spacing: 5) {
                                                Image(systemName: "minus")
                                                    .resizable()
                                                    .frame(width: 9, height: 2)
                                                    .font(Font.title.weight(.heavy))
                                                
                                                Text(String(basketCount[item.id] ?? 1))
                                                
                                                Image(systemName: "plus")
                                                    .resizable()
                                                    .frame(width: 9, height: 9)
                                                    .font(Font.title.weight(.heavy))
                                            }
                                            .font(.custom("MarkPro-Medium", size: 20))
                                            .foregroundColor(Color(.white))
                                        }
                                        .frame(width: 26, height: 68)
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                        .frame(width: 17)
                                    Image("Trash")
                                        .frame(width: 16, height: 16)
                                        .foregroundColor(viewColor)
                                    Spacer()
                                        .frame(width: 32)
                                }
                                
                                Spacer()
                            }
                            Spacer()
                        }
                        
                    }
                }
                
                Spacer()
                
                Checkout(data: $data)
                
                Spacer()
                    .frame(height: 44)
            }
            .foregroundColor(Color(.white))
        }
    }
}


struct Checkout: View {
    
    @Binding var data: MyCartData?
    let currency = "$"
    
    var body: some View {
        VStack {
            
            Color.white.opacity(0.25)
                .frame(height: 2)
            
            Spacer()
                .frame(height: 15)
            
            HStack {
                Spacer()
                    .frame(width: 55)
                VStack {
                    HStack {
                        Text("Total")
                            .font(.custom("MarkPro", size: 15))
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 12)
                    HStack {
                        Text("Delivery")
                            .font(.custom("MarkPro", size: 15))
                        Spacer()
                    }
                    
                }
                
                Spacer(minLength: 100)
                
                VStack {
                    HStack {
                        Text(currency + (data?.total ?? 0).formattedWithSeparator + " us")
                            .font(.custom("MarkPro-Bold", size: 15))
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 12)
                    HStack {
                        Text(data?.delivery ?? " ")
                            .font(.custom("MarkPro-Bold", size: 15))
                        Spacer()
                    }
                }
                .frame(width: 90)
                
                Spacer()
                    .frame(width: 35)
            }
            
            Spacer()
                .frame(height: 27)
            
            
            Color.white.opacity(0.25)
                .frame(height: 1)
            
            Spacer()
                .frame(height: 27)
            
            HStack {
                Spacer()
                    .frame(width: 44)
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("Orange"))
                        .frame(height: 54)
                        .cornerRadius(10)
                    Text("Checkout")
                        .font(.custom("MarkPro-Bold", size: 20))
                        .foregroundColor(.white)
                }
                Spacer()
                    .frame(width: 44)
            }
        }
    }
}
