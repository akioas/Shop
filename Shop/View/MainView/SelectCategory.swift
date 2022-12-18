

import SwiftUI


struct SelectCategory: View {
    
    private let categories = ["Phones", "Computer", "Health", "Books", "Heart"]
    
    @State var selectedCategory = "Phones"
    
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
                                        if selectedCategory == category {
                                            Color("Orange")
                                                .frame(width: 71, height: 71)
                                                .cornerRadius(36)
                                        } else {
                                            Color(.white)
                                                .frame(width: 71, height: 71)
                                                .cornerRadius(36)
                                        }
                                        Button(action: {
                                            selectedCategory = category
                                        }) {
                                            if selectedCategory == category {
                                                Image(category)
                                                    .frame(width: 32, height: 32)
                                                    .foregroundColor(.white)
                                                    .blendMode(.colorDodge)
                                            } else {
                                                Image(category)
                                                    .frame(width: 32, height: 32)
                                                    .foregroundColor(Color(red: 0.70, green: 0.70, blue: 0.76))
                                            }
                                        }
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
