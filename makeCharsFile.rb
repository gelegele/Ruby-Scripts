=begin
指定された範囲のコードポイントが示す文字をファイルに出力を生成します。

第一引数：コードポイント始点
第二引数：コードポイント終点
第三引数：[-f]コードポイントも含めて出力
          [-r]改行のみ加えて出力
=end

unless 2 <= ARGV.length
  print "Error! Execute with 2 more args.\n"
  exit
end

start_code_point = ARGV[0].hex
end_code_point = ARGV[1].hex

format = "none"
if 3 == ARGV.length 
  if ARGV[2] == "-f"
    format = "with code point"
  elsif ARGV[2] == "-r"
    format = "break"
  end
end

f = open("chars.txt", "w")

for code_point in start_code_point..end_code_point
  char = [code_point].pack("U*")
  code_point_str = sprintf("%#06x", code_point)
  if format == "with code point"
    output = "#{code_point_str}[#{char}]\n"
  elsif format == "break"
    output = char + "\n"
  else
    output = char
  end
  f.write(output)
end

f.close


