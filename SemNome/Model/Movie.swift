//
//  Movie.swift
//  SemNome
//
//  Created by jpcm2 on 12/07/22.
//

import Foundation
import UIKit

struct Movie: Codable {

    let title: String
    let posterPath: String
    let backdropPath: String
    let voteAverage: Float
    let releaseDate: String
    let overview: String
    let genres: [String]?
    
    static func getMonth(releaseDate: String) -> String{
        let mesAno: String = String(releaseDate.suffix(5))
        let mes = String(mesAno.prefix(2))
        let meses: [String] = ["Janeiro", "Feveiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
        let mesInt = Int(mes) ?? 0
        return String(meses[mesInt - 1].prefix(3))
    }
    
    static func getDay(releaseDate: String) -> String{
        return String(releaseDate.suffix(2))
    }
}
