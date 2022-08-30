//
//  PokemmonDetail.swift
//  PokenmonApp
//
//  Created by Praful Argiddi on 28/08/22.
//

import SwiftUI
import Kingfisher
struct PokemmonDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = PokemonviewModel()
    var pokemon:Pokemon
    var body: some View {
        ZStack {
            
            Color(viewModel.backgroundColor(forType: pokemon.type))
            
            ScrollView  {
                Spacer()
                    .frame( height: 40 )
                //            Product Image
                KFImage(URL(string: pokemon.imageUrl))
                
                    .resizable()
                    
                    .scaledToFit()
                    .frame(width: 200, height: 400)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                   
                        //.edgesIgnoringSafeArea(.top)
                
                DescriptionView(pokemon: pokemon)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        .edgesIgnoringSafeArea(.top)
    }
}
struct DescriptionView: View {
    var pokemon:Pokemon
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text(pokemon.name)
                .font(.title)
                .fontWeight(.bold)
            
            
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(pokemon.description)
                .lineSpacing(8.0)
                .opacity(0.6)
            
            //                Info
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Size")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Height: \(pokemon.height) cm")
                        .opacity(0.6)
                    Text("Weight: \(pokemon.weight) kg")
                        .opacity(0.6)
                    Text("type: \(pokemon.type)")
                        .opacity(0.6)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                
                
                
            }
            .padding(.vertical)
            
            
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: 0.0)
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct PokemmonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemmonDetail(pokemon: MOCK_POKEMON[1] )
    }
}
