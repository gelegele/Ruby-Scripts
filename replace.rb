# ファイル内テキストの単語単位での置換を行います
# 2012-11-16

# 置換対象パス
TARGET_DIR = "/hoge/hoge"
# 置換対象拡張子
TARGET_EXT = "java"
# 置換ルール
REPLACES = {
  "Boolean" => "boolean",
  "java.sql.Timestamp" => "java.util.Date",
  "Timestamp" => "Date"
}


Dir::glob(TARGET_DIR + "/*." + TARGET_EXT).each {|f|
  f = File.open(f, "r")
  buffer = f.read
  buffer.gsub!(/\b(#{REPLACES.keys.join("|")})\b/, REPLACES)
  f = File.open(f, "w")
  f.write(buffer)
  f.close
}
