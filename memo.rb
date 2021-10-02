require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp

# ifで条件分岐
if memo_type == "1"
  puts "<< 拡張子を除いたファイル名を入力してください >>"
  name_1 = gets.chomp
  while File.exist?("#{name_1}.csv") do
    puts "<< #{name_1}.csv は既に存在します　内容を上書きしますか？ YES or NO >>"
    answer = gets.chomp
    break if answer == "YES"
    puts "<< 拡張子を除いたファイル名を入力してください >>"
    name_1 = gets.chomp
  end
  puts "<< メモしたい内容を記入してください  完了したら Ctrl + D を押します >>"
  content_1 = readlines.map(&:chomp)
  CSV.open("#{name_1}.csv", 'w') do |csv|
    csv << content_1
  end
  puts "<< #{name_1}.csv を作成しました >>"
elsif memo_type == "2"
  puts "-------- ファイル一覧 ----------"
  Dir.glob('*.csv') do |csv|
    puts csv
  end
  puts "-----------------------------"
  puts "<< 拡張子を除いたファイル名を入力してください >>"
  name_2 = gets.chomp
  puts "<< メモしたい内容を記入してください  完了したら Ctrl + D を押します >>"
  content_2 = readlines.map(&:chomp)
  CSV.open("#{name_2}.csv", 'a') do |csv|
    csv << content_2
  end
  puts "<< #{name_2}.csv に追記しました >>"
end

puts "<< 終了します >>"