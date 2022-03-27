

import Foundation

struct Pokemons: Codable{
    var results: [Pokemon]
}

struct Pokemon: Codable{
    var url: String
}

struct PokeImage: Codable{
    var sprites: Sprite!
}

struct Sprite: Codable{
    var front_default: String
}
