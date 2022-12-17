import SwiftUI
 
struct SearchBar: View {
    @Binding var text: String
 
    @Binding var isEditing: Bool
 
    
    var body: some View {
        HStack {
 
            TextField("Search", text: $text) 
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
            
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: { _ in
            self.isEditing = false
                })
        
        
    }
}



