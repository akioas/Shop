

import SwiftUI


struct BestSeller: View {
    
    @Binding var bestSeller: [BestSellerData]?
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Best Seller")
                    .font(.custom("MarkPro-Bold", size: 25))
                    .foregroundColor(Color("Blue"))

                //font
                
                Spacer()
                
                Text("see more")
                    .foregroundColor(Color("Orange"))
                    .font(.custom("MarkPro", size: 15))

                Spacer()
                    .frame(width: 10)
                //size, font
                
            }
            
            ScrollView(.vertical) {
                HStack(spacing: 5) {
                    if let bestSeller = bestSeller {
                        ForEach(0..<(bestSeller.count)) { index in
                            ZStack{
                                Button(action: {
                                    Coordinator.push(view: ProductDetailsView())
                                })
                                {
                                    CachedImage(url: URL(string: (bestSeller[index].picture)))
                                }
                                Text(String(bestSeller[index].id))
                            }
                        }
                    }
                }
            }
        }
        
    }
    
}


