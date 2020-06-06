
class Quiz::CLI
    @@points = []
    def call
        puts "Welcome to football soccer quiz." 
        champion_league_url = "https://en.wikipedia.org/wiki/List_of_European_Cup_and_UEFA_Champions_League_finals"
        champion_league_file = Quiz::Scraper.champion_league(champion_league_url,"tbody")
        Quiz::CHAMPIONLEAGUE.champion_league_files(champion_league_file)
        champion_league = Quiz::CHAMPIONLEAGUE.all

        world_cup_url = "https://www.foxsports.com/soccer/fifa-world-cup/history"
        world_cup = Quiz::Scraper.world_cup(world_cup_url,"tbody")
        Quiz::Worldcup.world_cup_file(world_cup)
        world_cup = Quiz::Worldcup.all


        balon_d_or_url = "https://www.goal.com/es/noticias/todos-los-ganadores-del-balon-de-oro/wn19xivn1eh91t0jrslbzz5kq"
        players = Quiz::Scraper.balon_d_or_players(balon_d_or_url,".tableizer-table")
        Quiz::BALONDOR.balon_d_or(players)
        balon_d_or = Quiz::BALONDOR.all
         
        start_quiz(balon_d_or,champion_league,world_cup) 
    end
    
    def start_quiz(balon_d_or,champion_league,world_cup)
        puts "*************************************************************************"
        puts "Take this 10 question quiz to find out how much you know about soccer."
        puts "*************************************************************************"
        puts "You pass the test if you score 6 or more points."
        puts "*************************************************************************"
        puts "To take the quiz press enter, to exit press 1 and enter."
        input = gets
        while input.to_i != 1
            question_processor(balon_d_or,champion_league,world_cup)
            puts "To take the quiz one more time press enter. to exit press 1 and enter."
            input = gets   
        end
        puts "Thanks for playing Soccer quiz."
    end

    def multiple_choice(answer,winners)
        multiple_choice = []
        multiple_choice << answer
        until multiple_choice.size == 4  
            multiple_choice << winners.sample
            multiple_choice = multiple_choice.uniq
        end
        multiple_choice = multiple_choice.shuffle
        multiple_choice.each_with_index{|item,index| puts "#{index + 1}: #{item}"}
        input = ""
        loop do
            input = gets  
            if !(1..4).include?(input.to_i)
                 puts "Invalid choice, enter a number from 1 to 4"
            else break    
            end         
        end
        if multiple_choice.index(answer) == input.to_i - 1 
            @@points << 1
            puts "Right"
        else
            puts "Wrong. Right answer is #{multiple_choice.index(answer) + 1}: #{answer}." 
        end
        puts "Press enter to continue"
        gets
    end

     def question_selector(objects,question) 
       years = objects.map{|item| item.year} 
       winners = objects.map{|item|item.winner}
       hosts = objects.map{|item|item.host}
       runner_ups = objects.map{|item|item.runner_up}
       random_year = years.sample
       random_winner = winners.sample
       answer = objects.select{|item|item.year == random_year}
       titles_amount = objects.select{|item|item.winner == random_winner}.size
       winner = answer[0].winner
       host = answer[0].host
       runner_up = answer[0].runner_up
       
       if all_question("none",random_year)[question].include?("host")
           puts all_question(host,random_year)[question]
           multiple_choice(host,hosts)
       elsif all_question("none",random_year)[question].include?("runner-up")
           runner_ups = runner_ups.reject{|item| item == winner}
           puts all_question(winner,random_year)[question]
           multiple_choice(runner_up,runner_ups)
       elsif all_question("none",random_year)[question].include?("How many")
           puts all_question(random_winner,'none')[question]
           obtions = []
           counter = 1
           while obtions.size < 13
               obtions << counter
               counter += 1
            end
         multiple_choice(titles_amount,obtions)
       else 
           puts all_question(winner,random_year)[question]
           multiple_choice(winner,winners)
       end
     end

    def all_question(team, year)
        ["Who won the world cup in #{year}?",
         "Who was the host in #{year} world cup?",
         "#{team} won the World cup final in #{year}. Who was the runner-up?",
         "How many world cup #{team} has won?", 
         "Who won the champion leage in #{year}?",
         "#{team} won the Champion leage final in #{year}. Who was the runner-up?",
         "Who hosted champion league final in #{year}?",
         "Who won the balon d'Or in #{year}?",
         "How many balon de'or #{team} has won?",
         "How many Champion league #{team} has won?"         
        ]
    end


    def question_processor(balon_d_or,champion_leage,world_cup)
        last_20_champions = []
        counter = 44
        while counter < champion_leage.size
           last_20_champions << champion_leage[counter]
           counter += 1
        end 
        #    question_counter = 0
        #     until question_counter == 9
        #         if question_counter < 4
        #             question_selector(world_cup,question_counter)
        #         elsif question_counter > 4 && question_counter < 7
        #             question_selector(last_20_champions,question_counter)
        #         elsif question_counter > 6 && question_counter < 9 
        #         question_selector(balon_d_or,question_counter)
        #         else question_selector(champion_leage,question_counter) 
        #         question_counter += 1
        #  end
                question_selector(world_cup,0)
                question_selector(world_cup,1)
                question_selector(world_cup,2)
                question_selector(world_cup,3) 
                question_selector(last_20_champions,4) 
                question_selector(last_20_champions,5)
                question_selector(last_20_champions,6)
                question_selector(balon_d_or,7)                
                question_selector(balon_d_or,8)              
                question_selector(champion_leage,9)  
                 points = 0
                @@points.each{|i|points += i }
                if points > 5
                puts "Congratulation you score #{points} of 10 points."
                else puts "Sorry you failed. you score #{points} of 10 points."
                end
                Quiz::CLI.clear
        end

    def self.points
        @@points
    end
    def self.clear
        @@points.clear
    end   
end






