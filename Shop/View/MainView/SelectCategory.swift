

import SwiftUI


struct SelectCategory: View {
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                    .frame(width: 17)
                
                Text("Select Category")
                    .font(.custom("MarkPro-Bold", size: 25))
                    .foregroundColor(Color("Blue"))
                
                Spacer()
                Button(action: {}) {
                    Text("view all")
                        .foregroundColor(Color("Orange"))
                        .font(.custom("MarkPro", size: 15))
                }
                
                Spacer()
                    .frame(width: 35)
            }
            
            Categories()
        }
        
    }
    
}

struct Categories: View {
    
    private let categories = ["Phones", "Computer", "Health", "Books", " "]
    @State var selectedCategory = "Phones"
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer()
                    .frame(width: 21)
                HStack(spacing: 23) {
                    ForEach(categories, id: \.self) { category in
                        VStack {
                            
                            Button(action: {
                                selectedCategory = category
                            }) {
                                if selectedCategory == category {
                                    VStack {
                                        ZStack {
                                            Color("Orange")
                                                .frame(width: 71, height: 71)
                                                .cornerRadius(36)
                                            
                                            Image(category)
                                                .frame(width: 32, height: 32)
                                                .foregroundColor(.white)
                                                .blendMode(.colorDodge)
                                                .frame(alignment: .center)
                                        }
                                        Spacer()
                                            .frame(height: 7)
                                        Text(category)
                                            .foregroundColor(Color("Orange"))
                                            .font(.custom("MarkPro-Medium", size: 12))
                                    }
                                } else {
                                    VStack {
                                        ZStack {
                                            Color(.white)
                                                .frame(width: 71, height: 71)
                                                .cornerRadius(36)
                                            Image(category)
                                                .frame(width: 32, height: 32)
                                                .foregroundColor(Color(red: 0.70, green: 0.70, blue: 0.76))
                                                .frame(alignment: .center)
                                        }
                                        Spacer()
                                            .frame(height: 7)
                                        Text(category)
                                            .foregroundColor(Color("Blue"))
                                            .font(.custom("MarkPro-Medium", size: 12))
                                    }
                                }
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

