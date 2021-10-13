class Legendary_pokemon

  def initialize
    @battle_pokemon=[]
    legendary_pokemon=
      {name:"ルギア",hp:350,techniques:["ハイドロポンプ","サイコキネシス","はかいこうせん","つばめ返し"]},
      {name:"ギラティナ",hp:300,techniques:["だましうち","かみくだく","わるだくみ","シャドーダイブ"]},
      {name:"アルセウス",hp:400,techniques:["はかいこうせん","ばかちから","はかいこうせん","めいそう"]}
    @battle_pokemon<<legendary_pokemon
  end

  def select_pokemon
    puts "どのポケモンとたたかう❓"
    @battle_pokemon.each{|pokemon|
        pokemon.each_with_index{
        |poke,key|puts"#{key+1}#{poke[:name]}"
      }
    }
    input =gets.to_i-1
    @battle_pokemon.select{|pokemon| return pokemon[input]}
  end

end
