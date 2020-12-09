#仕様メモ
手持ちコイン100枚
ポイント0
入れるコインの数を選べる
コインを入れるとスロットが回る(1~9)
コインが減る
ボタンを押すとスロットが止まる
3回繰り返す
数字が3列で揃うとポイント獲得(入れたコインの数×倍)※横でも斜めでも可能
揃わなかったら最初に戻すが、コインは減ったまま


#コインとポイントを定義する
コイン：100枚
ポイント：0
※上記の増減は後で決める

#コインを入れる枚数を決める
0 (10枚) 1(20枚) 2(30枚)

#スロットを回す
コインを入れると１列(1~9)の数字がランダムで決まる処理を作成する
これを３回繰り返す

#結果の判断
3列の数字が(横で)同じだった場合
  ポイントを獲得
  再度スロットを回すか判断
3列の数字が揃わなかった場合
  コイン10以下ならゲームオーバー
  10以上なら再度スロットを回すか判断
