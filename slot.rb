$SLOT_NUMS = [1,2,3,4,5,6,7,8,9]
$COINS = ["10", "20" "30"]

# 手持ちコインとポイント
def your_assets
  @your_coin = 100 - $COINS[@selected_coin]
  your_point = 0 + 
  puts "あなたの所持コインは#{your_coin}枚、ポイントは#{your_point}です"
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
  @selected_coin = gets.to_i
  if check_range(@selected_coin, 0, 3)
    return select_coin
  elsif @your_coin < @selected_coin
    puts "コインが足りません、ゲームオーバーです"
    return false
  end
end

# 入れたコインの枚数を表示する、残りのコインを表示する
def print_selected_coin
  puts "------------------"
  puts "コインを#{$COINS[selected_coin]}枚入れました。"
  puts "残りのコインは#{your_coin}枚です"
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
end

# スロットを回す_2回目
def spin_slot_2
  puts "エンターを押してください"
  enter = gets
  if enter != ""
    @slot_num_2 = $SLOT_NUMS[rand($SLOT_NUMS.length)]
    puts "|#{@slot_num_1}|"+"|#{@slot_num_2}|"
  end
end

# スロットを回す_3回目
def spin_slot_3
  puts "エンターを押してください"
  enter = gets
  if enter != ""
    @slot_num_3 = $SLOT_NUMS[rand($SLOT_NUMS.length)]
    puts "|#{@slot_num_1}|" + "|#{@slot_num_2}|" + "|#{@slot_num_3}|"
  end
end

# スロットを回す
def spin_slot
  spin_slot_1
  spin_slot_2
  spin_slot_3
end

# 当たりの判定
def check_bonus
  @get_point = $COINS[@selected_coin]*2
  if @slot_num_1 == @slot_num_2 == @slot_num_3
    puts "おめでとうございます"
    puts "#{@get_point}ポイント獲得しました"
    return true
  else
    return true
  end
end

next_slot = true

while next_slot do
