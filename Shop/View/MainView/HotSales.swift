

import SwiftUI


struct HotSales: View {
    
    @Binding var homeStore: [HomeStoreData]?
    @State private var index = 0
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Hot Sales")
                    .font(.largeTitle)
                //font
                
                Spacer()
                
                Text("see more")
                    .foregroundColor(Color("Orange"))
                Spacer()
                    .frame(width: 10)
                //size, font
                
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
                                    
                                    CachedImage(url: URL(string: (homeStore[index].picture)))
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




