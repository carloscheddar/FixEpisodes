#! /bin/env/ruby
#Author: Carlos Feliciano Barba

print "Drag the show folder to the terminal window: "
path = gets.chomp(" \n") + "/"

show = File.basename(path).delete "\\"
seasons = 0
total_episodes = 0
name = []

Dir.glob(path + "*") do |f|
  if File.directory?(f) && f.include?("Season")
    seasons+=1
    season = f[-1]
    episodes = Dir.glob(path + "Season\ #{season}/*")

    episodes.each_with_index do |e, i|
      name[i] = "#{path}Season\ #{season}/#{show} - ".delete "\\"
      
      if season < 10
        name[i] += "s0#{season}" 
      else
        name[i] += "s#{season}"
      end
      
      if i+1 < 10
        name[i] += "e0#{i+1}#{File.extname(e)}"
      else
        name[i] += "e#{i+1}#{File.extname(e)}"
      end

      puts "#{e} will be #{name[i]}"
      
      total_episodes+=1
    end

    print "Do you agree with the new names? [Y/N]: "
    answer = gets.chomp
    if answer == "Y" || answer == "y"
      episodes.each_with_index do |e, i|
        File.rename(e, name[i])
      end
    else
      abort("Organize your files as the instructions stated")
    end
  end
  puts "Finished renaming Season #{season}"
end

puts "#{show} has #{seasons} seasons with #{total_episodes} episodes in total."
