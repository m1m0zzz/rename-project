target_dir = File.expand_path(ARGV[0])
# or
# target_dir = File.expand_path("path/to/Projects")

SEARCH_REG = /^(\d+-)?(?<title>.+) Project$/
RECURSIVE = true


class ProjectDir
  attr_accessor :path, :title, :created_at

  def initialize(path, title)
    @path = path
    @title = title.strip
    @created_at = File.birthtime(@path)
  end
end

def search_directory(target_dir, depth = 0)
  ary = []
  # SEARCH_REGにマッチしないフォルダを上に持ってくる
  Dir.children(target_dir).sort_by {|d| SEARCH_REG.match(d).nil? ? -1 : 1 }.each do |dir|
    path = File.expand_path(File.join(target_dir, dir))
    next unless File.directory?(path)

    if m = dir.match(SEARCH_REG)
      puts "  " * (depth + 1) + "[" + dir + "]"
      ary << ProjectDir.new(path, m[:title])
    else
      puts "  " * (depth + 1) + dir + "/"
      ary << search_directory(path, depth + 1) if RECURSIVE
    end
  end
  ary
end


puts "target folder"
puts target_dir

project_dirs = search_directory(target_dir).flatten
project_dirs.sort_by! { |pd| pd.created_at }

puts "================================"
puts "count: #{project_dirs.length}"

padding_size = [2, project_dirs.length.to_s.length].max

project_dirs.each_with_index do |pd, index|
  padding = sprintf("%0#{padding_size}d", index)
  name = "#{padding}-#{pd.title} Project"

  File.rename(pd.path, File.join(File.dirname(pd.path), name))
end

puts "Successful rename!"
