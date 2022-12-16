

import SwiftUI


struct HotSales: View {
    
    @Binding var homeStore: [HomeStoreData]?
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Hot Sales")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("see more")
                    .foregroundColor(Color("Orange"))
                
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    if let homeStore = homeStore {
                        ForEach(0..<(homeStore.count)) { index in
                            ZStack{
                                Button(action: {
                                    Coordinator.push(view: ProductDetailsView())
                                })
                                {
                                    
                                    AsyncImage(
                                        url: URL(string: (homeStore[index].picture)),
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
                                Text(String(homeStore[index].id))
                            }
                        }
                    }
                }
            }
        }
        
    }
    
}


