import SwiftUI


struct ProductDescription: View {
    
    @Binding var data: ProductDetailsData?
    @State var maxStars = 5
    
    var body: some View {
        
        ProductDescriptionTitle(data: $data)
        
        ProductDescriptionShop(data: $data)
        
        SelectColorCapacity(data: $data)
        
        AddToCart(data: $data)
        
    }
}


struct ProductDescriptionTitle: View {
    
    @Binding var data: ProductDetailsData?
    @State var maxStars = 5
    
    var body: some View {
        if let data = data {
            
            
            HStack {
                VStack {
                    Text(data.title)
                        .font(.title2)
                    
                    HStack {
                        
                        
                        ForEach((0..<Int(data.rating)), id: \.self) { star in
                            Image(systemName: "star.fill")
                        }
                        if (Int(data.rating) < 5) && (data.rating != Double(Int(data.rating))) {
                            Image(systemName: "star.leadinghalf.filled")
                                .onAppear(perform: {
                                    self.maxStars = 4
                                })
                        }
                        
                        ForEach((Int(data.rating)..<maxStars), id: \.self) { star in
                            Image(systemName: "star")
                        }
                        
                        
                    }
                }
                Spacer()
                if data.isFavorites {
                    Image(systemName: "heart.square.fill")
                }
                
            }
        }
        
    }
}

struct ProductDescriptionShop: View {
    
    @Binding var data: ProductDetailsData?
    
    var body: some View {
        if let data = data {
            VStack {
                HStack {
                    Text("Shop")
                    Text("Details")
                    Text("Features")
                }
                
                HStack {
                    VStack {
                        Image(systemName: "cpu")
                        Text(data.CPU)
                    }
                    VStack {
                        Image(systemName: "camera")
                        Text(data.camera)
                    }
                    VStack {
                        Image(systemName: "memorychip")
                        Text(data.ssd)
                    }
                    VStack {
                        Image(systemName: "sdcard")
                        Text(data.sd)
                    }
                }
                
            }
            
        }
    }
}

struct SelectColorCapacity: View {
    
    @Binding var data: ProductDetailsData?
    
    var body: some View {
        
        VStack {
            
            Text("Select color and capacity")
            
            if let data = data {
                
                HStack {
                    
                    HStack {
                        if let colors = data.color {
                            ForEach(colors, id: \.self) { color in
                                
                                Image(systemName: "circle.fill")
                                    .imageScale(.large)
                                    .foregroundColor(Color(hex: color))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        
                        if let capacities = data.capacity {
                            ForEach(capacities, id: \.self) { capacity in
                                
                                Text(capacity)
                                
                            }
                        }
                        
                    }
                }
            }
        }
        
    }
    
}



struct AddToCart: View {
    
    @Binding var data: ProductDetailsData?

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Orange"))
            HStack {
                Spacer()

                Text("Add to Cart")
                Spacer()
                if let price = data?.price {
                    Text("$" + String(price))
                }
                Spacer()

            }
            .foregroundColor(Color.white)
        }
        .cornerRadius(10)
    }
}
