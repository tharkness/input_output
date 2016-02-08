require 'rubygems'
require 'rest-client'
require 'open-uri'

# wiki_url = "http://en.wikipedia.org"
# wiki_local_filename = "wiki_page.html"

# File.open(wiki_local_filename, "w") do |file|
#   file.write(RestClient.get(wiki_url))
# end

# url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
# local_fname = "hamlet.txt"
# File.open(local_fname, "w") { |file| file.write(open(url).read) }

# File.open(local_fname, "r") do |file|
#   file.readlines.each_with_index do |line, idx|
#     puts line if idx % 42 == 41
#   end
# end

# DIRNAME = "/vagrant"
# Dir.glob("#{DIRNAME}/**").sort_by{|fname| File.size(fname)}.reverse[0..9].each do |fname|
#   puts "#{fname}\t#{File.size(fname)}"
# end

DIRNAME = "/vagrant"
hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
  ext = File.basename(fname).split(".")[-1].to_s.downcase
  hsh[ext] ||= [0, 0]
  hsh[ext][0] += 1
  hsh[ext][1] += File.size(fname)
  hsh
end

File.open("file-analysis.txt", "w") do |f|
  hash.each do |arr|
    txt = arr.flatten.join("\t")
    f.puts txt
    puts txt
  end
end