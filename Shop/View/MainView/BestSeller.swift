

import SwiftUI


struct BestSeller: View {
    
    @Binding var bestSeller: [BestSellerData]?
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Best Seller")
                    .font(.largeTitle)
                //font
                
                Spacer()
                
                Text("see more")
                    .foregroundColor(Color("Orange"))
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


