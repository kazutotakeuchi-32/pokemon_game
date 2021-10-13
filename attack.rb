class Attack

  def initialize(battle_pokemon,pokemon,pokemon_lists,pokemon_on_hand)
    @pokemon=battle_pokemon
    @legendary_pokemon=pokemon
    @pokemon_lists=pokemon_on_hand
    @select= pokemon_lists

  end
   def pokemon_attack(attack_pokemon,pokemon,pokemon_on_hand)
    if attack_pokemon[:name]==@legendary_pokemon[:name]
      puts "#{attack_pokemon[:name]}が#{attack_pokemon[:techniques].sample}を繰り出した"
      puts  Random.rand(0..2) == 0 ?  "#{life(pokemon,pokemon_on_hand)}": "#{pokemon[:name]}に攻撃が当たらなかった"
    elsif attack_pokemon[:name]==  @pokemon_lists[0][0][:name] || @pokemon_lists[0][1][:name] ||@pokemon_lists[0][2][:name]
        puts"どの技を使う❓"
        attack_pokemon[:techniques].each_with_index {|technique,keys|puts "#{keys+1}:#{technique}"}
        input =gets.to_i-1
        puts "#{attack_pokemon[:name]}が#{attack_pokemon[:techniques][input]}を繰り出した"
        puts  Random.rand(0..2) == 0 ?  "#{life(pokemon,pokemon_on_hand)}": "#{pokemon[:name]}に攻撃が当たらなかった"
    end
   end

    def life(pokemon,pokemon_on_hand)
      damages= [30,50,20,10]
      pokemon[:hp]-=damages.sample
      puts "#{pokemon[:name]}はダメージを受けた"
      if pokemon[:hp]<0&&pokemon[:name]==@pokemon[:name]
        puts"#{ pokemon[:name]}が倒れた"
      elsif pokemon[:hp]<0 && pokemon[:name]==@legendary_pokemon[:name]
          puts"#{ pokemon[:name]}が倒れたあなたの勝ちですです"
          exit
      elsif (@pokemon_lists[0][0][:hp]<=0) && (@pokemon_lists[0][1][:hp]<=0 ) && (@pokemon_lists[0][2][:hp]<=0)
          puts "あなたの手持ちのポケモンは全て力付きました"
          puts "あなたの負けです。"
          exit
      end
    end
end
