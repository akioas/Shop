

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
            VStack {
                
                MainTopBar(isShowing: $isShowingSettings)
                
                SelectCategory()
                
                SearchBar(text: $searchText, isEditing: $isEditing)
                
                HotSales(homeStore: $viewModel.homeStore)
                
                BestSeller(bestSeller: $viewModel.bestSeller)
                
                if !isShowingSettings {
                    Explorer()
                }
                
            }
            .padding()
            
            if !isEditing {
                Settings(isShowing: $isShowingSettings)
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
