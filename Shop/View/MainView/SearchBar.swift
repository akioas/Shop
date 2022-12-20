import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        
        HStack {
            ZStack {
                
                HStack{
                    
                    TextField("Search", text: $text)
                        .padding(7)
                        .padding(.horizontal, 38)
                        .background(Color(.white))
                        .foregroundColor(Color("Blue"))
                        .font(.custom("MarkPro", size: 12))
                        .cornerRadius(30)
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
                            Button(action: {}) {
                                Image("Search")
                                    .foregroundColor(.white)
                                
                            }
                        }
                        Spacer()
                    }
                }
                HStack {
                    Spacer()
                        .frame(width: 24)
                    Image("Glass")
                        .foregroundColor(Color("Orange"))
                        .opacity(0.7)
                    Spacer()
                }
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: { _ in
            self.isEditing = false
        })
    }
}



