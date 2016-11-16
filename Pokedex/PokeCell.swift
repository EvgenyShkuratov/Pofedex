//
//  PokeCell.swift
//  Pokedex
//
//  Created by Evgeny Shkuratov on 11/14/16.
//  Copyright © 2016 Evgeny Shkuratov. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        nameLbl.text = pokemon.name.capitalized
        imageView.image = UIImage(named: "\(self.pokemon.pokedexID)")
    }
    
}
