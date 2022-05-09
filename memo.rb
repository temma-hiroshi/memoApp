    require "csv"
 
    puts "1(新規でメモを作成) 2(既存のメモを編集する)"
 
    memo_type = gets.to_s.chomp

    if memo_type == '1'
      puts "新規でメモ作成を作成します"
      puts "拡張子を除いたファイル名を入力してください"
      
      new_file = gets.to_s.chomp

      puts "ーーーメモしたい内容を記入してくださいーーー"
      puts "ーーー完了したらcontrol+Dを押してくださいーーー"
      input = readlines
      
      CSV.open("#{new_file}.csv",'w') do |csv|
        input.each do |write|
        csv <<  [write.chomp]
        end
      end
      
    elsif memo_type == '2'
      puts "既存のメモを編集します"
      puts "拡張子を除くファイル名を入力してください"
      
      edit_file = gets.to_s.chomp
      
      puts "ーーー編集したい内容を記入してくださいーーー"
      puts "ーーー完了したらCtrl+Dを押してくださいーーー"
      
      input = readlines
      
      CSV.open("#{edit_file}.csv",'a') do |csv|
        input.each do |write|
        csv <<  [write.chomp]
        end
      end
      
    else
      puts "無効な入力です"
    end