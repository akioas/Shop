

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
                
                
                Spacer()
                
                if !isShowingSettings {
                    Button(action: {
                        Coordinator.push(view: MyCartView())
                    })
                    {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                    }
                }
                Button(action: {
                    Coordinator.push(view: ProductDetailsView())
                })
                {
                    Image(systemName: "flame")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                .onAppear {
                    viewModel.getData()
                    isShowingSettings = false
                }
                Text(viewModel.bestSeller?.first?.title ?? "MAIN")
                
            }
            .padding()
            
            
            Settings(isShowing: $isShowingSettings)
        }
        
    }
    
    
    
}




struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
