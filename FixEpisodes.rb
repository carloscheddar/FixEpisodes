#! /bin/env/ruby
#Author: Carlos Feliciano Barba

print "Drag the show folder to the terminal window: "    #Get folder from user
path = gets.chomp(" \n") + "/"

show = File.basename(path).delete "\\"                   #Delete the backlashes that generate with spaces
total_seasons = 0                                        #Variable to store total seasons(Only used for final output)
total_episodes = 0                                       #Variable to store total episodes(Only used for final output)
name = []                                                #Array to store the new name to be added at the rename phase

Dir.glob(path + "*") do |f|                              #Get the files and folders inside path and traverse one by one
  if File.directory?(f) && f.include?("Season")
    total_seasons+=1
    season = f[-1]                                       #Get Season number from the folder name
    
    episodes = Dir.glob(path + "Season\ #{season}/*")    #Store episodes in array to use later

    episodes.each_with_index do |e, i|
      name[i] = "#{path}Season\ #{season}/#{show} - s".delete "\\"
      
      name[i] += "0" if season.to_i < 10
      
      name[i] += "#{season}e"

      name[i] += "0" if i+1 < 10

      name[i] += "#{i+1}#{File.extname(e)}"

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

puts "#{show} has #{total_seasons} seasons with #{total_episodes} episodes in total."
