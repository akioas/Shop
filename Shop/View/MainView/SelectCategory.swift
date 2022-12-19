

import SwiftUI


struct SelectCategory: View {
    
    private let categories = ["Phones", "Computer", "Health", "Books", " "]
    
    @State var selectedCategory = "Phones"
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                //отступ 17 markpro 25 700
                
                Text("Select Category")
                    .font(.custom("MarkPro-Bold", size: 30))
                
                Spacer()
                
                Text("view all")
                    .foregroundColor(Color("Orange"))
                    //шрифт
                
                Spacer()
                    .frame(width: 18)
            }
            //отступ, расстояние
            
            ScrollView(.horizontal) {
                HStack(spacing: 23) {
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
                                            .frame(alignment: .center)
                                    } else {
                                        Image(category)
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(Color(red: 0.70, green: 0.70, blue: 0.76))
                                            .frame(alignment: .center)
                                    }
                                }
                            }
                            Spacer()
                                .frame(height: 7)
                            if selectedCategory == category {
                                Text(category)
                                    .foregroundColor(Color("Orange"))
                                    .font(.custom("MarkPro-Medium", size: 12))
                            } else {
                                Text(category)
                                    .foregroundColor(.black)
                                    .font(.custom("MarkPro-Medium", size: 12))
                            }
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
