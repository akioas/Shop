import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        
        HStack {
            ZStack {
                
                HStack{
                    Spacer()
                    //space
                    //font
                    //size, radius
                    TextField("Search", text: $text)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    Spacer()
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.text = ""
                            
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                    } else {
                        ZStack {
                            Color("Orange")
                                .frame(width: 30, height:30)
                                .cornerRadius(36)
                            //size
                            Button(action: {}) {
                                Image("Search")
                                    .foregroundColor(.white)
                                //size
                                
                            }
                        }
                        Spacer()
                        //size
                    }
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    //отступ
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("Orange"))
                    //icon
                    Spacer()
                }
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: { _ in
            self.isEditing = false
        })
    }
}



