## FixEpisodes ##
This script will rename your TV episodes to this format: ShowName - s01e02.

### Purpose
I made this with the purpose of organizing my TV shows to be completely recognizable by PLEX.

### Format
```
/TV Shows
   /Heroes
      /Season 2
         Heroes.2x01.mkv
      /Season 4
         Heroes_s04e01.mkv
         s04x02.mkv

will become:

/TV Shows
   /Heroes
      /Season 2
         Heroes - s02e02.mkv
      /Season 4
         Heroes - s04e01.mkv
         Heroes - s04e02.mkv

```
### Warnings

I am not responsible for loss of data while using this tool. It will ask you before renaming.
```
-Your episodes must be organized in their respective Season folder and in order. 
-No episode must be missing from the Season. Except later episodes (1,2,3,4 is ok; 1,4,7,11 is NOT ok).
-This tool won't work with multiple episodes in the same file.
-There can't be any other files in the folder other than the episodes. 
-SRT files must be removed from the folder before using the tool
-After agreeing to rename there is no going back.
```
### Example

```bash
ruby FixEpisodes.rb

Drag the show folder to the terminal window: Adventure Time 
Adventure Time/Season 2/2x01.mkv will be  Adventure Time/Season 2/Adventure Time - s02e01.mkv
Adventure Time/Season 2/2x02.mkv will be  Adventure Time/Season 2/Adventure Time - s02e02.mkv
Adventure Time/Season 2/2x03.mkv will be  Adventure Time/Season 2/Adventure Time - s02e03.mkv
Adventure Time/Season 2/2x04.mkv will be  Adventure Time/Season 2/Adventure Time - s02e04.mkv
Adventure Time/Season 2/2x05.mkv will be  Adventure Time/Season 2/Adventure Time - s02e05.mkv
Do you agree with the new names? [Y/N]: y
Finished renaming Season 2
Adventure Time has 1 seasons with 5 episodes in total.

```

### Future Progress
```
-Be able to parse episode names so that organazing the episodes becomes automatic.
-Be able to only rename movie files.
-Connect to tvdb to add episode names to the file.
```
### Bug reports
If you experience any issues please report them and I will take care of it as soon as possible.

### Pulls
Feel free to pull and improve the code.
