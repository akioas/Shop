import SwiftUI


struct ProductDescription: View {
    
    @Binding var data: ProductDetailsData?
    
    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea()
                .cornerRadius(30)
                .shadow(
                    color: Color(hex: "#4C5F8F1A").opacity(0.5),
                    radius: 4.0
                )
            
            VStack {
                
                ProductDescriptionTitle(data: $data)
                
                Spacer(minLength: 20)
                
                ProductDescriptionShop(data: $data)
                
                Spacer(minLength: 20)
                
                SelectColorCapacity(data: $data)
                
                Spacer()
                    .frame(height: 27)
                
                AddToCart(data: $data)
                
                Spacer()
                    .frame(height: 20)
                
            }
        }
        
    }
}


struct ProductDescriptionTitle: View {
    
    @Binding var data: ProductDetailsData?
    @State var maxStars = 5
    
    var body: some View {
        
        HStack {
            Spacer()
                .frame(width: 38)
            VStack {
                Spacer()
                    .frame(height: 28)
                HStack {
                    Text(data?.title ?? " ")
                        .foregroundColor(Color("Blue"))
                        .font(.custom("MarkPro-Medium", size: 24))
                    Spacer()
                }
                
                Spacer()
                    .frame(width: 7)
                
                HStack(spacing: 9) {
                    
                    ForEach((0..<Int(data?.rating ?? 0)), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(hex: "#FFB800"))
                            .frame(width: 18, height: 18)
                    }
                    if (Int(data?.rating ?? 0) < 5) && (data?.rating != Double(Int(data?.rating ?? 0))) {
                        Image(systemName: "star.leadinghalf.filled")
                            .foregroundColor(Color(hex: "#FFB800"))
                            .frame(width: 18, height: 18)
                        
                            .onAppear(perform: {
                                self.maxStars = 4
                            })
                            .onDisappear(perform: {
                                self.maxStars = 5
                            })
                    }
                    
                    ForEach((Int(data?.rating ?? 0)..<maxStars), id: \.self) { _ in
                        Image(systemName: "star")
                            .foregroundColor(Color(hex: "#FFB800"))
                            .frame(width: 18, height: 18)
                        
                    }
                    Spacer()
                }
            }
            Spacer()
            if (data?.isFavorites ?? false) {
                
                VStack {
                    Spacer()
                        .frame(height: 28)
                    ZStack {
                        Image("Rectangle")
                            .resizable()
                            .frame(width: 37, height: 33)
                            .foregroundColor(Color("Blue"))
                        Image("Heart")
                            .resizable()
                            .frame(width: 14, height: 13)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    
                }
                
            }
            Spacer()
                .frame(width: 37)
            
        }
        .frame(height: 83)
        
        
    }
}

struct ProductDescriptionShop: View {
    
    @Binding var data: ProductDetailsData?
    let detailsColor = Color(hex: "#B7B7B7")
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                    .frame(width: 45)
                Text("Shop")
                    .foregroundColor(Color("Blue"))
                    .font(.custom("MarkPro-Bold", size: 20))
                Spacer()
                Text("Details")
                    .foregroundColor(Color(hex: "#00000080")).opacity(0.5)
                    .font(.custom("MarkPro", size: 20))
                Spacer()
                Text("Features")
                    .foregroundColor(Color(hex: "#00000080")).opacity(0.5)
                    .font(.custom("MarkPro", size: 20))
                Spacer()
                    .frame(width: 40)
            }
            
            
            Spacer()
                .frame(height: 8)
            
            HStack {
                Spacer()
                    .frame(width: 27)
                
                Color("Orange")
                    .frame(width: 86, height: 3)
                    .cornerRadius(1)
                
                Spacer()
            }
            
            Spacer(minLength: 25)
            
            HStack {
                Spacer()
                    .frame(width: 30)
                VStack {
                    Image("Cpu")
                        .frame(width: 28, height: 28)
                    Text(data?.CPU ?? " ")
                        .font(.custom("MarkPro", size: 11))
                }
                Spacer()
                VStack {
                    Image("Camera")
                        .frame(width: 28, height: 28)
                    Text(data?.camera ?? " ")
                        .font(.custom("MarkPro", size: 11))
                }
                Spacer()
                VStack {
                    Image("Memory")
                        .frame(width: 28, height: 28)
                    Text(data?.ssd ?? " ")
                        .font(.custom("MarkPro", size: 11))
                }
                Spacer()
                VStack {
                    Image("Sd")
                        .frame(width: 28, height: 28)
                    Text(data?.sd ?? " ")
                        .font(.custom("MarkPro", size: 11))
                }
                Spacer()
                    .frame(width: 40)
            }
            .foregroundColor(detailsColor)
            
        }
    }
}

struct SelectColorCapacity: View {
    
    @Binding var data: ProductDetailsData?
    @State var selectedColor = 0
    @State var selectedCapacity = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                    .frame(width: 30)
                Text("Select color and capacity")
                    .font(.custom("MarkPro-Medium", size: 16))
                    .foregroundColor(Color("Blue"))
                Spacer()
            }
            
            Spacer()
                .frame(height: 15)
            
            
            HStack {
                
                Spacer()
                    .frame(width: 30)
                
                HStack(spacing: 20) {
                    if let colors = data?.color {
                        ForEach(colors, id: \.self) { color in
                            
                            Button(action: {
                                selectedColor = colors.firstIndex(of: color) ?? 0
                            }) {
                                ZStack {
                                    Color(hex: color)
                                        .cornerRadius(20)
                                        .frame(width: 39.3, height: 39.3)
                                    
                                    if selectedColor == colors.firstIndex(of: color) {
                                        Image("Checkmark")
                                            .foregroundColor(.white)
                                            .frame(width: 17.0, height: 12.5)
                                    }
                                }
                            }
                        }
                    } else {
                        // no data
                        Color(.clear)
                            .cornerRadius(20)
                            .frame(width: 39.3, height: 39.3)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 21) {
                    
                    if let capacities = data?.capacity {
                        ForEach(capacities, id: \.self) { capacity in
                            
                            Button(action: {
                                selectedCapacity = capacities.firstIndex(of: capacity) ?? 0
                            }) {
                                ZStack {
                                    if selectedCapacity == capacities.firstIndex(of: capacity) {
                                        Color("Orange")
                                            .cornerRadius(10)
                                            .frame(width: 80, height: 31.5, alignment: .center)
                                        
                                        Text(capacity + " GB")
                                            .foregroundColor(.white)
                                            .font(.custom("MarkPro-Bold", size: 13))
                                    } else {
                                        Color(.clear)
                                            .frame(width: 80, height: 31.5, alignment: .center)
                                        Text(capacity + " gb")
                                            .foregroundColor(Color(hex: "#B7B7B7"))
                                            .font(.custom("MarkPro-Bold", size: 13))
                                    }
                                }
                            }
                        }
                        
                    } else {
                        // no data
                        Color(.clear)
                            .frame(width: 80, height: 31.5, alignment: .center)
                    }
                }
                Spacer()
                    .frame(width: 42)
            }
        }
    }
}




struct AddToCart: View {
    
    @Binding var data: ProductDetailsData?
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                    .frame(width: 30)
                Rectangle()
                    .foregroundColor(Color("Orange"))
                    .cornerRadius(10)
                    .frame(height: 54)
                Spacer()
                    .frame(width: 30)
            }
            
            HStack {
                Spacer()
                
                Text("Add to Cart")
                Spacer()
                Text("$" + ((data?.price ?? 0).formattedWithSeparator) + ".00")
                Spacer()
            }
            .font(.custom("MarkPro-Bold", size: 20))
            .foregroundColor(Color.white)
        }
    }
}
