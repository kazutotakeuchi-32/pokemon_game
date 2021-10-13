class Pokemon_on_hand

  def initialize
    @pokemon_on_hand=[]
    puts "どのポケモンたちでたたかう"
    puts "[1]エレキブル、バンギラス、ピカチュウ"
    puts "[2]ジュガイン、リザードン、グラエナ"
    puts "[3]ゲッコウガ、リーフィア、ボスコドラ"
    input =gets.to_i
    case input
    when 1
      pokemon=
        {name:"エレキブル",hp:100,techniques:["10万ボルト","あなをほる","かみなりパンチ","からわり"]},
        {name:"バンギラス",hp:100,techniques:["だましうち","かみくだく","わるだくみ","はかいこうせん"]},
        {name:"ピカチュウ",hp:100,techniques:["10万ボルト","アイアンテール","でんこうせっか","ボルテッカー"]}
    when 2
      pokemon=
        {name:"ジュガイン",hp:100,techniques:["リーフブレード","ハードプラント","でんこうせっか","じしん"]},
        {name:"リザードン",hp:100,techniques:["かえんほうしゃ","そらをとぶ","ちきゅうなげ","だいもんじ"]},
        {name:"カビゴン"  ,hp:100 ,techniques:["はかいこうせん","ばかちから","かいりき","のしかかり"]}
    when 3
      pokemon=
        {name:"ゲッコウガ",hp:100,techniques:["ハイドロポンプ","みずしゅりけん","いあいぎり","つばめ返し"]},
        {name:"リーフィア",hp:100,techniques:["リーフストーム","かみくだく","でんこうせっか","あなをほるー"]},
        {name:"ボスコドラ",hp:100,techniques:["はかいこうせん","ばかちから","アイアンテール","いわなだれ"]}
    end
    @pokemon_on_hand<<pokemon
  end

  def pokemon_on_hand
   return @pokemon_on_hand
  end

  def pokemon_list(pokemon_on_hand)
        puts " 手持ちのポケモン"
        @pokemon_on_hand.each do |pokemon|
          pokemon.each_with_index do|poke,key|
            puts  poke[:hp]>0 ?  " #{key+1}.HP:#{poke[:hp]}#{poke[:name]}" : "瀕死（#{poke[:name]}は使えません)"
            end
         end
        puts "どのポケモンを出す❓"
        input =gets.to_i
        if @pokemon_on_hand[0][input-1][:hp]>0
          puts @pokemon_on_hand[0][input-1][:name]
          return @pokemon_on_hand[0][input-1]
        else
          puts "#{@pokemon_on_hand[0][input-1][:name]}は瀕死状態なので入れ替える事はできないよ"
          pokemon_on_hand.pokemon_list(pokemon_on_hand)
        end
    end



    def select_pokemon_that_uses_items(poke_hand)
      puts @Pokemon_on_hand
      @pokemon_on_hand.each do |pokemon|
        pokemon.each_with_index do|poke,key|
          puts  poke[:hp]>0 ?  " #{key+1}.HP:#{poke[:hp]}#{poke[:name]}" : "瀕死（#{poke[:name]}は使えません)"
          poke[:dying]="瀕死"  if poke[:hp]<=0
        end
      end
      puts "どのポケモンを回復させる❓"
      input = gets.to_i
      return @pokemon_on_hand[0][input-1] if @pokemon_on_hand[0][input-1][:hp]==100
      if @pokemon_on_hand[0][input-1][:dying]=="瀕死"
        puts "瀕死のポケモンは回復する事はできないよ"
        return @pokemon_on_hand[0][input-1]
      end
        puts "#{@pokemon_on_hand[0][input-1][:name]}"
        return @pokemon_on_hand[0][input-1]
    end
end
