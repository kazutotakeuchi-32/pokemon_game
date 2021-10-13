
class Item
  def initialize(kizugusuri,mantan,monster_bole,haiper_bole,legendary_pokemon_name)
    @kizugusuri=kizugusuri
    @mantan=mantan
    @monster_bole=monster_bole
    @haiper_bole=haiper_bole
    @legendary_pokemon_name=legendary_pokemon_name
  end

  def items_select(battle_pokemon,poke_hand)
      puts  "[1]きずぐすり✖︎#{@kizugusuri}"
      puts  "[2]まんたんなくすり✖︎#{@mantan}"
      puts  "[3]モンスターボール✖︎#{@monster_bole}"
      puts  "[4]ハイパーボール✖︎#{@haiper_bole}"
      puts  "[5]戻る"
      input =gets.to_i
    case input
        when 1
            return puts "きずぐすりは無くなった" if @kizugusuri==0
            battle_pokemon = pokemon_selecter(poke_hand,battle_pokemon)
            puts battle_pokemon
            return  if battle_pokemon[:dying]== "瀕死"
            return puts"HPはまんたんだからアイテムを使う必要がないよ"  if battle_pokemon[:hp]==100
            @kizugusuri = consume_item(@kizugusuri)
            recovery(battle_pokemon,@kizugusuri)
        when 2
            return puts "まんたんのくすりは無くなった" if @mantan==0
            battle_pokemon = pokemon_selecter(poke_hand,battle_pokemon)
            puts battle_pokemon
            return if battle_pokemon[:dying]== "瀕死"
            return puts"HPはまんたんだからアイテムを使う必要がないよ"  if battle_pokemon[:hp]==100
            @mantan = consume_item(@mantan)
            recovery(battle_pokemon,@mantan)
        when 3
            return puts "モンスターボールは無くなった" if @monster_ball==0
            @monster_bole= consume_item(@monster_bole)
            puts"モンスターボールを投げた"
            catch_pokemon(@monster_ball,@legendary_pokemon_name)
        when 4
            return puts "ハイパーボールは無くなった" if @haiper_bole==0
            @haiper_bole= consume_item(@haiper_bole)
            puts"ハイパーボールを投げた"
            catch_pokemon(@haiper_bole,@legendary_pokemon_name)
        else
          puts "戻る"
    end
  end

  def pokemon_selecter(poke_hand,battle_pokemon)
    poke_hand=poke_hand.select_pokemon_that_uses_items(poke_hand)
    return poke_hand
  end

  def consume_item(item)
    item-=1
  end

  def recovery(poke_hand,item)
    poke_hand[:hp]+=40  if item==@kizugusuri
    poke_hand[:hp]=100  if item==@mantan
    if poke_hand[:hp] >= 100
       poke_hand[:hp] = 100
      puts"HPが満タンになった"
    end
  end

  def catch_pokemon(monster_ball,legendary_pokemon_name)
    puts "・・・"
    gets
    if Random.rand(0..2) == 0
      puts"やった〜#{legendary_pokemon_name}を捕まえたぞ"
      exit
    elsif  Random.rand(0..2) == 1
      puts "だめだ捕まらない"
    elsif  Random.rand(0..2) == 2
      puts "あ〜もう少しだったなのに〜"
    end
  end
end
