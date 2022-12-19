

import SwiftUI


struct HotSales: View {
    
    @Binding var homeStore: [HomeStoreData]?
    @Binding var isShowingSettings: Bool
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Hot Sales")
                    .foregroundColor(Color("Blue"))
                    .font(.custom("MarkPro-Bold", size: 25))
                
                Spacer()
                Button(action: {}) {
                    Text("see more")
                        .foregroundColor(Color("Orange"))
                        .font(.custom("MarkPro", size: 15))
                }
                
                Spacer()
                    .frame(width: 10)
      
            }
            
            if !isShowingSettings {
                Tabs(homeStore: $homeStore)
            } else {
                Tabs(homeStore: $homeStore)
                    .underline()
            }
            
        }
        
    }
    
}

struct Tabs: View {
    
    @Binding var homeStore: [HomeStoreData]?
    @State private var index = 0
    
    var body: some View {
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
                                    .frame(height: 182)
                                    .cornerRadius(10)
                            }
                            HStack {
                                Spacer()
                                    .frame(width: 25)
                                
                                VStack {
                                    if homeStore[index].isNew ?? false {
                                        Spacer()
                                            .frame(height: 14)
                                        HStack {
                                            ZStack {
                                                Color("Orange")
                                                    .frame(width: 27, height: 27)
                                                    .cornerRadius(14)
                                                Text("New")
                                                    .font(.system(size: 10, weight: .heavy))
                                                    .foregroundColor(.white)
                                                
                                            }
                                            Spacer()
                                        }
                                    } else {
                                        Spacer()
                                            .frame(height: 23)
                                    }
                                        Spacer()
                                            .frame(height: 18)
                                        HStack {
                                            Text(homeStore[index].title)
                                                .font(.system(size: 25, weight: .heavy))
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        Spacer()
                                            .frame(height: 5)
                                        HStack {
                                            Text(homeStore[index].subtitle)
                                                .font(.system(size: 12))
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        Spacer()
                                            .frame(height: 26)
                                        if homeStore[index].isBuy {
                                            HStack {
                                                Button(action: {}) {
                                                    ZStack {
                                                        Color.white
                                                            .cornerRadius(5)
                                                            .frame(width: 98, height: 23, alignment: .center)
                                                        Text("Buy now!")
                                                            .font(.system(size: 11, weight: .heavy))
                                                            .foregroundColor(Color("Blue"))
                                                    }
                                                }
                                                Spacer()
                                            }
                                            Spacer()
                                                .frame(height: 26)
                                        } else {
                                            Spacer()
                                                .frame(height: 23)
                                        }
                                        Spacer()
                                    }
                                }
                                Spacer()
                            
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            } else {
                Color.white
                    .frame(height: 182)
                    .cornerRadius(10)
            }
        }
    }
}



