

import SwiftUI


struct ProductImages: View {
    
    @Binding var images: [String]?
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Hot Sales")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("see more")
                    .foregroundColor(Color("Orange"))
                
            }
            
            
            VStack{
                Carousel(images: $images)
            }
        }
        
        
    }
    
}




struct Carousel: View {
    
    @Binding var images: [String]?
    @State var focusedImage = 0
    @State var x : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30.0
    
    var body: some View {
        HStack {
            if let images = images {
                if focusedImage > 0 {
                    
                    CachedImage(url: URL(string: images[focusedImage - 1])!
                                
                                
                    )
                    .frame(width: 200, height: 200)
                    .offset(x: self.x)
                    
                }
                CachedImage(url: URL(string: images[focusedImage])!
                            
                )
                .frame(width: 300, height: 300)
                .offset(x: self.x)
                
                
                if focusedImage < (images.count - 1)  {
                    CachedImage(url: URL(string: images[focusedImage + 1])!
                                
                    )
                    .frame(width: 200, height: 200)
                    .offset(x: self.x)
                    
                }
            }
        }
        
        .frame(width: UIScreen.main.bounds.width - 30, height: 400)
        
        .highPriorityGesture(DragGesture()
                             
            .onChanged({ (value) in
                
                if value.translation.width > 0{
                    
                    self.x = value.location.x
                }
                else{
                    
                    self.x = value.location.x - self.screen
                }
                
            })
                .onEnded({ (value) in
                    
                    if value.translation.width > 0{
                        
                        
                        if value.translation.width > (100) && focusedImage != 0{
                            
                            
                            focusedImage -= 1
                           
                            self.x = 0
                        }
                        else{
                            
                            self.x = 0
                        }
                    }
                    else{
                        
                        
                        if -value.translation.width > (100) && focusedImage !=  ((self.images?.count ?? 0) - 1){
                            
                            focusedImage += 1
                            print(focusedImage)
                            
                            self.x = 0
                        }
                        else{
                            
                            self.x = 0
                        }
                    }
                })
        )
        
    }
}

