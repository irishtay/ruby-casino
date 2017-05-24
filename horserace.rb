require 'tty-prompt'
require 'pry'
class Horserace

  attr_reader :name, :horsenames, :options, :player


  def initialize(gaming_options, player)
    @name = 'Horse Race'
    @options = gaming_options
    @horsenames = ['Charley', 'Darth Mare', 'MyLittleBrony', 'Princess Buttercup', 'Deathbringer']
    @player = player
    @outcomes = [1, 2, 3, 4, 5]
    @play_option = []
    @answer
  end

  def start_game

    prompt = TTY::Prompt.new
    @play_option = prompt.select("#{name}, Welcome to the races! Pick your horse: ", @horsenames)
    puts "Great choice! How much would you like to put on your horse? Balance is #{player.wallet.get_balance}"
    @answer = gets.chomp.to_i
    sleep(1)
    puts "AND THEY'RE OFF!"
    pid = fork{ exec 'afplay', "horserace.mp3" }
    sleep(1)
    random_number = @outcomes.sample
      case random_number
        when 1
          charley
          if @play_option == 'Charley'
            define_winner
          elsif
            define_loser
          end

        when 2
          darth
          if @play_option == 'Darth Mare'
            define_winner
          else
            define_loser
          end
        when 3
          brony
          if @play_option == 'MyLittleBrony'
            define_winner
          else
            define_loser
          end
        when 4
          princess
          if @play_option == 'Princess Buttercup'
            define_winner
          else
            define_loser
          end
        when 5
          death
          if @play_option == 'Deathbringer'
            define_winner
          else
            define_loser
          end
      end
    sleep(2)

  end

  def charley
    puts 'Coming into the final stretch is Darth Mare!'
    sleep(3)
    puts 'Following Mare is MyLittleBrony! Followed by Charly! Followed by Princess Buttercup! Who would have been followed by Deathbringer had he not been taken out by a runaway hot dog stand...'
    sleep(3)
    puts 'MyLittleBrony closes the gap!'
    sleep(3)
    puts 'They are neck and neck folks! Coming up on the finish li....'
    sleep(3)
    puts 'OH NO!!'
    sleep(3)
    puts 'OH THE CARNAGE!'
    sleep(3)
    puts 'For the folks listening at home, a beam from the rafters has just fallen onto the track crushing MyLittleBrony and Darth Mare'
    sleep(3)
    puts 'A plume of dust has risen from the field! This could be the end of this race fol...'
    sleep(3)
    puts "WHAT'S THIS?!?! A HORSE HAS JUST BROKEN THROUGH THE CLOUD"
    sleep(3)
    puts "HE CROSSES THE FINISH LINE AND IT'S....IT'S....."
    sleep(3)
    puts "IT'S CHARLEY LADIES AND GENTLEMEN! CHARLEY HAS WON THE KENTUCKY FRIED DERBY!!"
    sleep(3)

  end

  def darth
    puts "What an exciting race this has been!"
    sleep(3)
    puts "As the jockies round the final corner it's MyLittleBrony leading the pack, followed by Princess Buttercup"
    sleep(3)
    puts "Followed by Darth Mare"
    sleep(3)
    puts "Followed by Charley"
    sleep(3)
    puts "Folllowed by Deathbringer"
    sleep(3)
    puts "Followed by a random streaker...if security can please make it's way to the track please"
    sleep(3)
    puts "It looks like MyLittleBrony will be this years champi"
    sleep(3)
    puts "OH NOOOOOOOOO!"
    sleep(3)
    puts "MyLittleBrony has just tripped over air! He goes down!!!"
    sleep(3)
    puts "This should now be an easy win for Princess Bu...."
    sleep(3)
    puts "OHHHH NOOOOOO!"
    sleep(3)
    puts "Princess Buttercup has just collided with MyLittleBrony due to her jockey checking out the bombshell in section W"
    sleep(3)
    puts "Honestly can't say I blame him....wow...."
    sleep(3)
    puts "Avoiding the wreckage is Darth Mare!!!!!"
    sleep(3)
    puts "Darth Mare has just won this years PrincessDianaShouldHaveWornASeatBelt Derby! Followed by Charley followed by....the streaker."
    sleep(3)
    puts "Security to the track please...now!"
    sleep(3)
  end

  def brony
    puts "What an intense battle we've witnessed here today!"
    sleep(3)
    puts "Coming into our final lap it's Charley leading the pack!"
    sleep(3)
    puts "Followed by Princess Buttercup"
    sleep(3)
    puts "Followed by Deathbringer"
    sleep(3)
    puts "Followed by Darth Mare"
    sleep(3)
    puts "Bringing up the rear is MyLittleBrony who at this point should honestly just turn around and go home"
    sleep(3)
    puts "What an embarrassing performance this has been for MyLittleBrony"
    sleep(3)
    puts "I'm not sure exactly what the team was thinking putting MyLittleBrony into this race a mere 2 days after receiving his new prosthetic leg"
    sleep(3)
    puts "What a horrific scene we witnessed in last weeks race when MyLittleBrony lost his leg"
    sleep(3)
    puts "Our thoughts and prayers go out to the family of gypsies and Bobo, the dancing Amish clown. May they rest in peace"
    sleep(3)
    puts "Well folks our race is coming to a close with Charley rounding the final turn..Wait!"
    sleep(3)
    puts "What's is that coming out of Brony's leg..?"
    sleep(3)
    puts "OH MY!"
    sleep(3)
    puts "IS THAT...IT IS! IT'S A FLAMETHROWER!"
    sleep(3)
    puts "OH THE HUMANITY!"
    sleep(3)
    puts "Ladies and Gentlemen listening at home, the scene before me is to graphic to describe..."
    sleep(3)
    puts "As the first....and only...horse limps across the finish line we have a new champion this year..."
    sleep(3)
    puts "Let us all applaud as police make their way to the field"
    sleep(3)
    puts "May that Brony never see the light of day again..."
    sleep(3)
  end

  def princess
    puts "Ladies and gentlemen what an exciting race it's been as the horses make their way around the final turn!"
    sleep(3)
    puts "Leading the pack is Deathbringer, with Princess Buttercup and Charley right on his tail."
    sleep(3)
    puts "Bringing up the rear is Darth Mare who would have been followed by MyLittleBrony if he hadn't been taken out by random sniper fire early on..."
    sleep(3)
    puts "Princess and Charley close the gap coming down the straight away!"
    sleep(3)
    puts "It's coming down to the wire! This may be a photo finish folks!"
    sleep(3)
    puts "Wait what is Buttercups jockey doing...?!"
    sleep(3)
    puts "OH MY!!"
    sleep(3)
    puts "Jimmy John has just lept from Buttercup onto Deathbringer, taking out his jockey with a well placed karate chop!"
    sleep(3)
    puts "OH NOOOOOOO!"
    sleep(3)
    puts "He's just swerved straight into Charley bringing them both down in a massive pile up!"
    sleep(3)
    puts "In all my years of announcing I have never seen something so bizarre!"
    sleep(3)
    puts "Crossing the finish line...without her jockey...is Princess Buttercup!"
    sleep(3)
    puts "does that count? we counting that?"
    sleep(3)
    puts "Huh color me shocked, we're counting that"
    sleep(3)
    puts "Buttercup wins!!!!"
    sleep(3)
  end

  def death
    puts "As this exciting race nears it's end it's Princess Buttercup leading the pack with Charley and Deathbringer following close behind!"
    sleep(3)
    puts "In an extremely odd turn of events MyLittleBrony and Darth Mare are still nowhere to be seen..."
    sleep(3)
    puts "I'm getting word they left the race early on to sort out their differences after last weeks fight to the near-death"
    sleep(3)
    puts "You know what, good for them"
    sleep(3)
    puts "So often we forget our humanity in the heat of competition"
    sleep(3)
    puts "I salute the both of them for their display of sportsmanship"
    sleep(3)
    puts "We can all take a page from that Brony and Mare"
    sleep(3)
    puts "In fact, I'm going to follow in there example and call my ex"
    sleep(3)
    puts "Afterwards I'll go home and talk to that ass of a cat I brou.."
    sleep(3)
    puts "...what's that?"
    sleep(3)
    puts "Oh crap, the race"
    sleep(3)
    puts "Sorry about that folks, got a little sidetracked there"
    sleep(3)
    puts "Yah, Deathbringer won."
    sleep(3)
    puts "But you know who's the real winner here? Common decency."
    sleep(3)
    puts "See you all next year."
    sleep(3)
  end

  def define_winner
      puts "YOU WIN!!"

      puts "Go collect your winnings! (Press Enter)"
      player.wallet.add_money(@answer.to_i * 2)
      gets
      puts `killall afplay`

     options.display_menu_of_games
  end

  def define_loser
      puts "Loser...."
      puts "Tough break...maybe try your luck at Russian Roulette? (Press Enter)"
      gets
      puts `killall afplay`
      player.wallet.remove_balance(@answer.to_i)


      options.display_menu_of_games
    end



end
