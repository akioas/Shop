

import SwiftUI


struct BestSeller: View {
    
    @Binding var bestSeller: [BestSellerData]?
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let separator = 7.0
    let currency = "$"
    
    var body: some View {
        
        VStack {
            
            BestSellerTop()
            
            HStack(spacing: 0) {
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns) {
                        if let bestSeller = bestSeller {
                            ForEach(0..<((bestSeller.count < 3) ? bestSeller.count : 4), id: \.self) { index in
                                
                                HStack {
                                    Spacer()
                                        .frame(width: separator)
                                    ZStack {
                                        Color.white
                                            .cornerRadius(10)
                                            .frame(width: 179 - separator, height: 227)
                                        
                                        VStack {
                                            Button(action: {
                                                Coordinator.push(view: ProductDetailsView())
                                            })
                                            {
                                                CachedImage(url: URL(string: (bestSeller[index].picture)))
                                                    .frame(width: 179 - separator, height: 177)
                                                    .cornerRadius(10)
                                                
                                            }
                                            Spacer()
                                                .frame(height: separator)
                                            HStack {
                                                Spacer()
                                                    .frame(width: 21)
                                                Text(currency + bestSeller[index].priceWithoutDiscount.formattedWithSeparator)
                                                    .foregroundColor(Color("Blue"))
                                                    .font(.custom("MarkPro-Bold", size: 16))
                                                Spacer()
                                                    .frame(width: 7)
                                                VStack {
                                                    Spacer()
                                                        .frame(height: 4)
                                                    Text(currency + bestSeller[index].discountPrice.formattedWithSeparator)
                                                        .foregroundColor(Color(hex: "#CCCCCC"))
                                                        .font(.custom("MarkPro-Medium", size: 10))
                                                        .frame(alignment: .bottomLeading)
                                                        .strikethrough()
                                                }
                                                Spacer()
                                            }
                                            Spacer()
                                                .frame(height: 6)
                                            HStack {
                                                Spacer()
                                                    .frame(width: 21)
                                                Text(bestSeller[index].title)
                                                    .foregroundColor(Color("Blue"))
                                                    .font(.custom("MarkPro", size: 10))
                                                    .frame(maxHeight: 12)
                                                Spacer()
                                            }
                                            Spacer()
                                                .frame(height: 19 + 2 * separator)
                                        }
                                        
                                        BestSellerFavorite(isFavorites: bestSeller[index].isFavorites)
                                    }
                                    
                                }
                                
                            }
                            Spacer()
                                
                        } else {
                            //no data
                            Spacer()
                            
                        }
                    }
                    
                }
                Spacer()
            }
            Spacer()
                .frame(height: 35)
        }
        
    }
    
}

struct BestSellerTop: View {
    var body: some View {
        HStack {
            
            Text("Best Seller")
                .font(.custom("MarkPro-Bold", size: 25))
                .foregroundColor(Color("Blue"))
            
            Spacer()
            Button(action: {}) {
                Text("see more")
                    .foregroundColor(Color("Orange"))
                    .font(.custom("MarkPro", size: 15))
            }
            Spacer()
                .frame(width: 10)
            
        }
        
        Spacer()
            .frame(height: 16)
    }
}

struct BestSellerFavorite: View {
    
    var isFavorites: Bool
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 11)
            HStack {
                Spacer()
                ZStack {
                    Color.white
                        .frame(width: 25, height: 25)
                        .cornerRadius(13)
                        .shadow(
                            color: Color(hex: "#4C5F8F1A").opacity(0.9),
                            radius: 1.0 )
                    Button(action: {}) {
                        if isFavorites {
                            Image("HeartFilled")
                                .foregroundColor(Color("Orange"))
                                .frame(width: 11, height: 10)
                        } else {
                            Image("Heart")
                                .foregroundColor(Color("Orange"))
                                .frame(width: 11, height: 10)
                        }
                    }
                }
                Spacer()
                    .frame(width: 12)
            }
            Spacer()
            
        }
    }
}


