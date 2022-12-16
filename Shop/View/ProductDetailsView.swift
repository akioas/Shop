

import SwiftUI


struct ProductDetailsView: View {
    
    @ObservedObject private var viewModel = ProductViewModel()
    
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            VStack {
                Button {
                    Coordinator.pop()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.green)
                    
                }
                
                Button(action: {
                    Coordinator.push(view: MyCartView())
                })
                {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                .onAppear {
                    if viewModel.viewData == nil {
                        viewModel.getData()
                    }
                }
                Text(viewModel.viewData?.color?.first ?? "DETAILS")
            }
        }
        
    }
        
}





struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}
