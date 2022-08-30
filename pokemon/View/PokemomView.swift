//
//  PokemomView.swift
//  PokenmonApp
//
//  Created by Praful Argiddi on 26/08/22.
//

import SwiftUI

struct PokemomView: View {
    private let columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonviewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns,spacing: 20){
                    ForEach(viewModel.pokemon){ pokemon in
                        NavigationLink(
                            destination: PokemmonDetail( pokemon: pokemon),
                            label: {
                                PokemonCell(pokemon: pokemon, viewModel: viewModel)
                            })
                       // .navigationBarHidden(true)
                        .foregroundColor(.black)
                        
                    }
                }
            }.navigationTitle("Pokemon")
        }
    }
}
struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
struct PokemomView_Previews: PreviewProvider {
    static var previews: some View {
        PokemomView()
    }
}
