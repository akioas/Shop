

import SwiftUI


struct BestSeller: View {
    
    @Binding var bestSeller: [BestSellerData]?
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Best Seller")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("see more")
                    .foregroundColor(Color("Orange"))
                
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
                                    
                                    AsyncImage(
                                        url: URL(string: (bestSeller[index].picture)),
                                        content: { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 100, maxHeight: 100)
                                        },
                                        placeholder: {
                                            ProgressView()
                                        }
                                    )
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


