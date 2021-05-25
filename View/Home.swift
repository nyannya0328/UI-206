//
//  Home.swift
//  UI-206
//
//  Created by にゃんにゃん丸 on 2021/05/25.
//

import SwiftUI

struct Home: View {
    @State var selectedTab : Trip = trips[0]
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                let frame = proxy.frame(in:.global)
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                    .cornerRadius(0)
                
                
                
            }
            .ignoresSafeArea()
            
            VStack{
                
                Text("Lets Go With")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom,10)
                
                Text("Procotrip")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.bottom,50)
                
                
                
                VStack{
                    GeometryReader{proxy in
                        
                        let frame = proxy.frame(in:.global)
                        
                        TabView(selection:$selectedTab){
                            
                            ForEach(trips){trip in
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: frame.width, height: frame.height)
                                    .tag(trip)
                                   
                                
                                
                                
                                
                                
                            }
                            
                            
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                        
                        
                        
                        
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.1)
                    Text(selectedTab.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .shadow(color: .white, radius: 10, x: 5, y: 5)
                        .shadow(color: .white, radius: 10, x: -5, y: -5)
                    PageController(maxPage: trips.count, currentpage: getIndex())
                       
                       
                    
                }
                .padding(.vertical,15)
                .padding(.horizontal)
                .background(Color.white.clipShape(CustomShape()))
                .cornerRadius(10)
                .shadow(color: .red, radius: 10, x: 5, y: 5)
                .shadow(color: .red, radius: 10, x: -5, y: -5)
                
                
                
               
                
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("GET STARTED")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(
                        Color.primary
                          .overlay(
                            RoundedRectangle(cornerRadius: 10)
                             .stroke(Color.white,lineWidth: 3)
                                        )
                        )
                        .cornerRadius(10)
                })
                
                
                
            }
            .padding()
            
            
            
        }
    }
    func getIndex()->Int{
        
        let index = trips.firstIndex { trip in
            selectedTab.id == trip.id
        } ?? 0
        
        return index
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            let midWidth = rect.width / 2
            
            path.addLine(to: CGPoint(x: midWidth - 70, y: rect.height))
            
            path.addLine(to: CGPoint(x: midWidth - 70, y: rect.height - 25))
            
            path.addLine(to: CGPoint(x: midWidth + 75, y: rect.height - 25))
            
            path.addLine(to: CGPoint(x: midWidth + 75, y: rect.height))
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            
            
        }
    }
}
