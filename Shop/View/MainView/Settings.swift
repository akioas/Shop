import SwiftUI

struct Settings: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            if (isShowing) {
                
                Color.white
                    .ignoresSafeArea()
                    .cornerRadius(30)
                    .shadow(
                        color: Color(hex: "#4C5F8F1A").opacity(0.9),
                        radius: 8.0
                    )
                
                VStack {
                    
                    Spacer()
                        .frame(height: 24)
                    
                    HStack {
                        
                        Spacer()
                            .frame(width: 44)
                        
                        Button(action: {
                            isShowing.toggle()
                        })
                        {
                            ZStack {
                                Image("Rectangle")
                                    .resizable()
                                    .frame(width: 37, height: 37)
                                    .foregroundColor(Color("Blue"))
                                Image("Xmark")
                                    .resizable()
                                    .frame(width: 11, height: 11)
                                    .foregroundColor(Color.white)
                            }
                        }
                        Spacer()
                        
                        Text("Filter options")
                            .foregroundColor(Color("Blue"))
                            .font(.custom("MarkPro-Medium", size: 18))
                        
                        Spacer()
                        
                        Button(action: {
                            isShowing.toggle()
                        })
                        {
                            ZStack {
                                Color("Orange")
                                    .cornerRadius(10)
                                Text("Done")
                                    .foregroundColor(.white)
                                    .font(.custom("MarkPro-Medium", size: 18))
                            }
                            .frame(width: 83, height: 37)
                        }
                        Spacer()
                            .frame(width: 20)
                    }
                    
                    Spacer()
                    
                    Filter()
                    
                    Spacer()
                    
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct Filter: View {
    
    private var viewModel = MainViewModel()
    
    @State var brandList: [String] = [""]
    @State var priceList: [String] = [""]
    @State var sizeList: [String] = [""]
    
    @State var selectedBrand = ""
    @State var selectedPrice = ""
    @State var selectedSize = ""
    
    @State var isShowingBrands = false
    @State var isShowingPrice = false
    @State var isShowingSize = false
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                    .frame(width: 46)
                
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("Brand")
                                .foregroundColor(Color("Blue"))
                                .font(.custom("MarkPro-Medium", size: 18))
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 10)
                        ZStack {
                            Button(action: {
                                isShowingBrands.toggle()
                            }) {
                                FilterSelectButton(item: selectedBrand)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                        Text("Price")
                            .foregroundColor(Color("Blue"))
                            .font(.custom("MarkPro-Medium", size: 18))
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 10)
                        ZStack {
                            Button(action: {
                                isShowingPrice.toggle()
                            }) {
                                FilterSelectButton(item: selectedPrice)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                        Text("Size")
                            .foregroundColor(Color("Blue"))
                            .font(.custom("MarkPro-Medium", size: 18))
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 10)
                        ZStack {
                            Button(action: {
                                isShowingSize.toggle()
                            }) {
                                FilterSelectButton(item: selectedSize)
                                    .frame(height: 37)
                            }
                        }
                        
                        Spacer()
                    }
                }
                
                Spacer()
                    .frame(width: 31)
                
            }
            if isShowingSize {
                VStack {
                    List(self.sizeList, id: \.self) { item in
                        Button(action: {
                            isShowingSize.toggle()
                            self.selectedSize = item
                        }) {
                            Text(item)
                                .foregroundColor(Color("Blue"))
                        }
                    }
                }
            }
            if isShowingPrice {
                VStack {
                    List(self.priceList, id: \.self) { item in
                        Button(action: {
                            isShowingPrice.toggle()
                            self.selectedPrice = item
                        }) {
                            Text(item)
                                .foregroundColor(Color("Blue"))
                        }
                    }
                }
            }
            if isShowingBrands {
                VStack {
                    List(self.brandList, id: \.self) { item in
                        Button(action: {
                            isShowingBrands.toggle()
                            self.selectedBrand = item
                        }) {
                            Text(item)
                                .foregroundColor(Color("Blue"))
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            self.brandList = viewModel.getBrands()
            self.priceList = viewModel.getPrice()
            self.sizeList = viewModel.getSize()
            self.selectedSize = self.sizeList.first ?? ""
            self.selectedBrand = self.brandList.first ?? ""
            self.selectedPrice = self.priceList.first ?? ""
        })
    }
}

struct FilterSelectButton: View {
    var item: String?
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                    .frame(width: 14)
                Text(item ?? "")
                    .foregroundColor(Color("Blue"))
                    .font(.custom("MarkPro", size: 18))
                Spacer()
                Image("Chevron")
                    .foregroundColor(Color(red: 0.70, green: 0.70, blue: 0.76))
                    .frame(width: 16, height: 8)
                Spacer()
                    .frame(width: 14)
            }
            .frame(height: 37)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(hex: "#DCDCDC"), lineWidth: 1)
                )
        }
    }
}
