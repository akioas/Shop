import SwiftUI

struct Settings: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                VStack {
                    
                    
                    HStack {
                        
                        Button(action: {
                            isShowing.toggle()
                        })
                        {
                            Image(systemName: "ant")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            isShowing.toggle()
                        })
                        {
                            Image(systemName: "person")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            
                        }
                    }
                    .padding(.top, 500)

                    
                    Color.red
                        .ignoresSafeArea()
                    
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}
