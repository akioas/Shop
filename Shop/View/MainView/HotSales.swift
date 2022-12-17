

import SwiftUI


struct HotSales: View {
    
    @Binding var homeStore: [HomeStoreData]?
    @State private var index = 0
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Hot Sales")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("see more")
                    .foregroundColor(Color("Orange"))
                
            }
            
            
            HStack(spacing: 5) {
                if let homeStore = homeStore {
                    TabView(selection: $index) {
                        ForEach((0..<homeStore.count), id: \.self) { index in
                            
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
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
            }
            
        }
        
    }
    
}




