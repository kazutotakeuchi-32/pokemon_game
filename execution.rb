require './legendary_pokemon'
require './pokemon_on_hand'
require './attack'
require './item'

# 伝説のポケモン定義
legendary_pokemon=Legendary_pokemon.new
pokemon=legendary_pokemon.select_pokemon

# 手持ちのポケモン定義
puts"たたかうポケモンは、#{pokemon[:name]}"
pokemon_on_hand =Pokemon_on_hand.new
pokemons=pokemon_on_hand.pokemon_on_hand
battle_pokemon=pokemon_on_hand.pokemon_list(pokemon_on_hand)

# たたかう
attack= Attack.new(battle_pokemon,pokemon, pokemon_on_hand,pokemons)

# アイテム
item=Item.new(5,3,10,6,pokemon[:name])

# コマンド
puts "やせい#{pokemon[:name]}が現れた"
puts "ゆけ#{battle_pokemon[:name]}"

 while true do
      puts "HP:#{pokemon[:hp]}#{pokemon[:name]}"
      puts "HP:#{battle_pokemon[:hp]}#{battle_pokemon[:name]}"
      puts"[1]たたかう"
      puts"[2]バッグ"
      puts"[3]ポケモン"
      puts"[4]逃げる"
      input=gets.to_i
      case input
        when 1
            attack.pokemon_attack(battle_pokemon,pokemon,pokemon_on_hand)
            attack.pokemon_attack(pokemon,battle_pokemon,pokemon_on_hand)
            battle_pokemon =  pokemon_on_hand.pokemon_list(pokemon_on_hand)  if battle_pokemon[:hp] <=0
        when 2
           item.items_select(battle_pokemon,pokemon_on_hand)
           attack.pokemon_attack(pokemon,battle_pokemon,pokemon_on_hand)
           battle_pokemon  =  pokemon_on_hand.pokemon_list(pokemon_on_hand)  if battle_pokemon[:hp] <=0
        when 3
          battle_pokemon =pokemon_on_hand.pokemon_list(pokemon_on_hand)
          puts "ゆけ#{battle_pokemon[:name]}"
          attack.pokemon_attack(pokemon,battle_pokemon,pokemon_on_hand)
          battle_pokemon = pokemon_on_hand.pokemon_list(pokemon_on_hand)  if battle_pokemon[:hp] <=0
        when 4
            puts "・・・"
            gets
          if Random.rand(0..2) == 0
            puts"上手く逃げ切れた"
            exit
          else
            puts "逃げられなかった"
          end
           attack.pokemon_attack(pokemon,battle_pokemon,pokemon_on_hand)
           battle_pokemon = pokemon_on_hand.pokemon_list(pokemon_on_hand)  if battle_pokemon[:hp] <=0
        end
      end
