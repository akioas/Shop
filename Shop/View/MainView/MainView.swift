

import SwiftUI


struct MainView: View {
    
    @ObservedObject private var viewModel = MainViewModel()
    @State var isShowingSettings = false
    @State var searchText = ""
    
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                
                TopBar(isShowing: $isShowingSettings)
                
                SelectCategory()
                
                SearchBar(text: $searchText)
                
                HotSales(homeStore: $viewModel.homeStore)
                
                BestSeller(bestSeller: $viewModel.bestSeller)
                
                if !isShowingSettings {
                    Explorer()
                }
                
            }
            .padding()
            
            
            Settings(isShowing: $isShowingSettings)
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
