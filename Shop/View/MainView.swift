

import SwiftUI


struct MainView: View {
    
    @ObservedObject private var viewModel = MainViewModel()
    @State var isShowingSettings = false
    
    
    var body: some View {
        VStack {
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
            Text(viewModel.viewData?.bestSeller.first?.title ?? "MAIN")
            Button{
                withAnimation{
                    isShowingSettings.toggle()
                }
            } label: {
                Text("SETTINGS")
            }
        }
        .padding()
    
        
        SettingsView(isShowing: $isShowingSettings)
        
    }
    
}
