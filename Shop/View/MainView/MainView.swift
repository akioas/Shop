

import SwiftUI


struct MainView: View {
    
    @ObservedObject private var viewModel = MainViewModel()
    @State var isShowingSettings = false
    @State var searchText = ""
    @State var isEditing = false
    
    var body: some View {
        
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Spacer()
                            .frame(width: 17)
                        MainTopBar(isShowing: $isShowingSettings)
                        
                        
                        Spacer()
                            .frame(width: 17)
                    }
                    Spacer()
                        .frame(height: 24)
                }
                VStack(spacing: 0) {
                    SelectCategory()
                    
                    Spacer()
                        .frame(height: 35)
                    HStack {
                        Spacer()
                            .frame(width: 17)
                        VStack(spacing: 0) {
                            SearchBar(text: $searchText, isEditing: $isEditing)
                            
                            Spacer()
                                .frame(height: 24)
                            
                            HotSales(homeStore: $viewModel.homeStore, isShowingSettings: $isShowingSettings)
                                .frame(height: 233)
                            
                            Spacer()
                                .frame(height: 11)
                            
                            BestSeller(bestSeller: $viewModel.bestSeller)
                            
                        }
                        Spacer()
                            .frame(width: 17)
                    }
                }
            }.padding(.top, 0.1)
            
            if !isShowingSettings {
                VStack{
                    Spacer()
                    Explorer()
                }.ignoresSafeArea()
                
            }
            
            
            if !isEditing {
                VStack {
                    Spacer()
                    Settings(isShowing: $isShowingSettings)
                        .frame(height: 375, alignment: .bottom)
                }.ignoresSafeArea()
            }
        }
        
        
        .onAppear {
            if (viewModel.bestSeller == nil || viewModel.homeStore == nil) {
                viewModel.getData()
            }
            isShowingSettings = false
        }
    }
    
}








struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
