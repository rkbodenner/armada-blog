#!/usr/bin/ruby

origFiles = ARGV
origFiles.each do |f|
  nameChunks = f.split('.')
  extension = nameChunks.pop
  before = nameChunks.join('.')
  size = 740
  tag = "#{size}w"
  newFile = "#{before}.#{tag}.#{extension}"
  if ( ! (f =~ /#{tag}\.#{extension}$/i ) && ! File.exist?(newFile) )
    puts "Resizing #{f}"
    system("convert #{f} -resize #{size} #{newFile}")
    system("mogrify -strip #{newFile}")
  else
    puts "Skipping #{f}"
  end
end
