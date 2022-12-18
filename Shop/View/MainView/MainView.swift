

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
            VStack(spacing: 0) {
                
                Spacer(minLength: 79)
                
                MainTopBar(isShowing: $isShowingSettings)
                
                SelectCategory()
                
                SearchBar(text: $searchText, isEditing: $isEditing)
                
                HotSales(homeStore: $viewModel.homeStore)
                
                BestSeller(bestSeller: $viewModel.bestSeller)
                
                if !isShowingSettings {
                    Explorer()
                }
                
            }
            
            if !isEditing {
                Settings(isShowing: $isShowingSettings)
            }
        }
        .ignoresSafeArea()

        
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
