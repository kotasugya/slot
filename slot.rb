$SLOT_NUMS = [1,2,3,4,5,6,7,8,9]
$COINS = [10, 20, 30]

# 手持ちコインとポイント
def your_assets
  @your_coin = 100
  @your_point = 0
  puts "あなたの所持コインは#{@your_coin}枚、ポイントは#{@your_point}です"
  return select_coin
end

# 選択肢の範囲内かチェックする
def check_range(exact, from, to)
  if from > exact || to < exact
    puts "そんな選択肢はありません、選び直してください"
    return true
  end
  return false
end

# 入れるコインを選択する(選択肢の範囲外は繰り返し、コインが足りなければゲームオーバー)
def select_coin
  puts "入れるコインの枚数を選択してください"
  puts "0(10枚), 1(20枚), 2(30枚) 3(ゲームをやめる)"
  @selected_num = gets.to_i
  @take_coin = $COINS[@selected_num]
  if check_range(@selected_num, 0, 3)
    select_coin
  elsif @selected_num == 3
    puts "しっぽを巻いて逃げ出した"
    return false
  elsif @your_coin < @take_coin
    puts "コインが足りません、ゲームオーバーです"
    return false
  else
    print_selected_coin
    spin_slot_1
  end
end

# 入れたコインの枚数を表示する、残りのコインを表示する
def print_selected_coin
  puts "------------------"
  puts "コインを#{@take_coin}枚入れました。"
  puts "------------------"
end

# スロットを回す_1回目
def spin_slot_1
  puts "エンターを押してください"
  enter = gets
  if enter != ""
    @slot_num_1 = $SLOT_NUMS[rand($SLOT_NUMS.length)]
    puts "|#{@slot_num_1}|"
  end
  spin_slot_2
end

# スロットを回す_2回目
def spin_slot_2
  puts "エンターを押してください"
  enter = gets
  if enter != ""
    @slot_num_2 = $SLOT_NUMS[rand($SLOT_NUMS.length)]
    puts "|#{@slot_num_1}|"+"|#{@slot_num_2}|"
  end
  spin_slot_3
end

# スロットを回す_3回目
def spin_slot_3
  puts "エンターを押してください"
  enter = gets
  if enter != ""
    @slot_num_3 = $SLOT_NUMS[rand($SLOT_NUMS.length)]
    puts "|#{@slot_num_1}|" + "|#{@slot_num_2}|" + "|#{@slot_num_3}|"
  end
  check_bonus
end

# スロットを回す
def spin_slot
  your_assets
end

# 当たりの判定
def check_bonus
  if @slot_num_1 == @slot_num_2 && @slot_num_1 == @slot_num_3
    @get_point = @take_coin * 2
    puts "おめでとうございます"
    puts "#{@get_point}ポイント獲得しました"
    return true
  else
    return true
  end
end

next_game = true

while next_game do
  next_game = spin_slot
end