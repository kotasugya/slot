# 仕様メモ
# 入力をするごとにスロットの値がきまる（１セット３回入力）
# 値が揃った場合はポイントを獲得できる
# スロットを一回行う毎にコインを消費する
# コインがある場合は「スロットを行う」または「やめる」を選択できる
# コインがなくなった場合はスロットゲームを終了とする
#https://app.gitbook.com/@potepan/s/rails-2/shi-jian-ke-ti/ruby

# ーーーーーーーーーーーーーーーーーーーー
# コインとポイントを定義する
# コイン：100枚
# ポイント：0
# ※上記の増減は後で決める

# 手持ちのコインとポイントを表示する
def your_assets
  your_coin = 100 - coins[selected_coin]
  your_point = 0 #増えるように書き足す
  puts "あなたの所持コインは#{your_coin}枚、ポイントは#{your_point}です"
end

# 入れるコインを選択する(選択肢の範囲外は繰り返し、コインが足りなければゲームオーバー)
def select_coin
  puts "入れるコインの枚数を選択してください"
  puts "0(10枚), 1(20枚), 2(30枚) 3(ゲームをやめる)"
  selected_coin = gets.to_i
  if  check_range(selected_coin, 0,3)
    select_coin
  elsif your_coin > select_coin
    puts "コインが足りません、ゲームオーバーです"
    return false
  else
    return  selected_coin
  end
end

# 入れたコインの枚数を表示する、残りのコインを表示する
def print_selected_coin
  coins = ["10", "20" "30"]
  puts "------------------"
  puts "コインを#{coins[selected_coin]}枚入れました。"
  puts "残りのコインは#{your_coin}枚です"
  puts "------------------"
end

# スロットを回す
def spin_slot
  slot_nums = [1,2,3,4,5,6,7,8,9]
  puts "エンターを押してください"
  enter = gets
  if enter != ""
  (0..2).each do |i|
      slot_num = slot_nums[rand(slot_nums.length)]
      puts "|#{slot_num}|"
    end
  end
end

spin_slot

# 必ず初回のスロットが回る

# スロットを回す
# コインを入れると１列(1~9)の数字がランダムで決まる処理を作成する
# これを３回繰り返し処理する

# # 結果の判断
# 3列の数字が(横で)同じだった場合
#   ポイントを獲得
#   再度スロットを回すか判断
# 3列の数字が揃わなかった場合
#   再度スロットを回すか判断

# # ポイントの倍率
# 数字が揃った場合、入れたコインの倍のポイントを与える