
class Quiz::CLI
    @@points = []
    def call
        puts "Welcome to football soccer quiz." 
        start_quiz
    end
    
    def start_quiz
        puts "*************************************************************************"
        puts "Take this 10 question quiz to find out how much you know about soccer."
        puts "*************************************************************************"
        puts "You pass the test if you score 6 or more points."
        puts "*************************************************************************"
        puts "To take the quiz press enter, to exit press 1 and enter."
        input = gets


        while input.to_i != 1
            question_processor
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
        instace_for_answers = objects.select{|item|item.year == random_year}   
        answer_for_how_many = objects.select{|item|item.winner == random_winner}.size
        winner = instace_for_answers[0].winner      
        host = instace_for_answers[0].host
        runner_up = instace_for_answers[0].runner_up
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
        multiple_choice(answer_for_how_many,obtions)
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
   

    def question_processor
        champion_league = Quiz::CHAMPIONLEAGUE.all
        world_cup = Quiz::Worldcup.all
        balon_d_or = Quiz::BALONDOR.all
        last_20_champions = []
        counter = 44
        while counter < champion_league.size
           last_20_champions << champion_league[counter]
           counter += 1
        end
        question_selector(world_cup,0)
        question_selector(world_cup,1)
        question_selector(world_cup,2)
        question_selector(world_cup,3) 
        question_selector(last_20_champions,4) 
        question_selector(last_20_champions,5)
        question_selector(last_20_champions,6)
        question_selector(balon_d_or,7)                
        question_selector(balon_d_or,8)              
        question_selector(champion_league,9)  
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







