

import SwiftUI


struct Carousel: View {
    
    @Binding var images: [String]?
    @State var focusedImage = 0
    @State var x: CGFloat = 0
    let swipeOffset: CGFloat = 50.0
    let radius: CGFloat = 20.0
    let imagewidth = 0.67
    let smallImageWidth = 0.12
    let smallImageHeight = 0.8
    let spacerWidth = 0.06
    
    var body: some View {
        GeometryReader { reader in
            HStack {
                if let images = images {
                    //left image
                    if focusedImage > 0 {
                        CachedImage(url: URL(string: images[focusedImage - 1])!)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: reader.size.width * smallImageWidth, height: reader.size.height * smallImageHeight, alignment: .trailing)
                            .clipped()
                            .padding(.leading, radius)
                            .cornerRadius(radius)
                            .padding(.leading, -radius)
                            .shadow(
                                color: Color.gray.opacity(0.55),
                                radius: 8,
                                y: 8
                            )
                        
                    } else {
                        Color(.clear)
                            .frame(width: reader.size.width * smallImageWidth, height: reader.size.height * smallImageHeight)
                    }
                    
                    Spacer(minLength: reader.size.width * spacerWidth)
                    //focused image
                    CachedImage(url: URL(string: images[focusedImage])!)
                        .frame(width: reader.size.width * imagewidth, height: reader.size.height)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(radius)
                        .shadow(
                            color: Color.gray.opacity(0.55),
                            radius: 8,
                            y: 8
                        )
                    
                    Spacer(minLength: reader.size.width * spacerWidth)
                    
                    //right image
                    if focusedImage < (images.count - 1) {
                        CachedImage(url: URL(string: images[focusedImage + 1])!)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: reader.size.width * smallImageWidth, height: reader.size.height * smallImageHeight, alignment: .leading)
                            .clipped()
                            .padding(.trailing, radius)
                            .cornerRadius(radius)
                            .padding(.trailing, -radius)
                            .shadow(
                                color: Color.gray.opacity(0.55),
                                radius: 8,
                                y: 8
                            )
                        
                    } else {
                        Color(.clear)
                            .frame(width: reader.size.width * smallImageWidth, height: reader.size.height * smallImageHeight)
                    }
                }
                //no image
                else {
                    Spacer(minLength: reader.size.width * (spacerWidth + smallImageWidth))
                    Color(.white)
                        .frame(width: reader.size.width * imagewidth, height: reader.size.height)
                        .cornerRadius(radius)
                        .shadow(
                            color: Color.gray.opacity(0.55),
                            radius: 8,
                            y: 8
                        )
                    Spacer(minLength: reader.size.width * (spacerWidth + smallImageWidth))
                }
                
            }
            
            
            //swipe
            .highPriorityGesture(DragGesture()
                                 
                .onChanged({ (value) in
                    
                    if value.translation.width > 0 {
                        self.x = value.location.x
                    }
                    else {
                        self.x = value.location.x - reader.size.width
                    }
                    
                })
                    .onEnded({ (value) in
                        
                        if value.translation.width > 0 {
                            
                            if value.translation.width > (swipeOffset) && focusedImage != 0 {
                                
                                focusedImage -= 1
                                
                            }
                            
                        }
                        else {
                            
                            if -value.translation.width > (swipeOffset) && focusedImage !=  ((self.images?.count ?? 0) - 1) {
                                
                                focusedImage += 1
                                
                            }
                            
                        }
                        self.x = 0
                    })
                                 
            )
        }
    }
}

