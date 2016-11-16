//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Evgeny Shkuratov on 11/14/16.
//  Copyright © 2016 Evgeny Shkuratov. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        pokedexIDLbl.text = "\(pokemon.pokedexID)"
        let img = UIImage(named: "\(pokemon.pokedexID)")
        mainImg.image = img
        currentImg.image = img
        
        
        pokemon.downloadPokemonDetail { 
            self.updateUI()
        }
    }
    
    func updateUI() {
        baseAttackLbl.text = pokemon.attack
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        defenseLbl.text = pokemon.defense
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) Level: \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
