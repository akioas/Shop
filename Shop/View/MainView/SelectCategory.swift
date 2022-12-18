

import SwiftUI


struct SelectCategory: View {
    
    private let categories = ["Phones", "Computer", "Health", "Books", "circle"]
    
    @State var selectedCategory = 0
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Select Category")
                    .font(.custom("MarkPro-Bold", size: 30))
                
                Spacer()
                
                Text("view all")
                    .foregroundColor(Color("Orange"))
                
            }
            
            ScrollView(.horizontal) {
                        HStack(spacing: 15) {
                            ForEach(categories, id: \.self) { category in
                                VStack {
                                    ZStack {
                                        Image(category)
                                            .frame(width: 100, height: 100)
                                            .background(Color("Orange"))
                                            .cornerRadius(50)
                                    }
                                    Text(category)
                                       .foregroundColor(Color("Orange"))
                                }
                            }
                        }
                    }
            
        }
        
    }
    
}

struct SelectCategory_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategory()
    }
}
