# class Quiz::CLI
#     def call
#         champion_league_url = "https://en.wikipedia.org/wiki/List_of_European_Cup_and_UEFA_Champions_League_finals"
#         champion_league_file = Quiz::Scraper.champion_league(champion_league_url,"tbody")
#         Quiz::CHAMPIONLEAGUE.champion_league_files(champion_league_file)
#         champion_league = Quiz::CHAMPIONLEAGUE.all

#         world_cup_url = "https://www.foxsports.com/soccer/fifa-world-cup/history"
#         world_cup = Quiz::Scraper.world_cup(world_cup_url,"tbody")
#         Quiz::Worldcup.world_cup_file(world_cup)
#         world_cup = Quiz::Worldcup.all


#         balon_d_or_url = "https://www.goal.com/es/noticias/todos-los-ganadores-del-balon-de-oro/wn19xivn1eh91t0jrslbzz5kq"
#         players = Quiz::Scraper.balon_d_or_players(balon_d_or_url,".tableizer-table")
#         Quiz::BALONDOR.balon_d_or(players)
#         balon_d_or = Quiz::BALONDOR.all

#         # quiz = Quiz::MultipleChoice.new
#         # quiz.question_processor
#         puts "Welcome to football soccer quiz."  
#         start_quiz(balon_d_or,champion_league,world_cup) 
#     end


#     def start_quiz(balon_d_or,champion_league,world_cup)
#         puts "Take this 10 question quiz to find out how much you know about soccer."
#         puts "To take the quiz press enter, to exit press 1 and enter"
#         input = gets
#         while input.to_i != 1
#             quiz = Quiz::MultipleChoice.new
#             quiz.question_processor(balon_d_or,champion_league,world_cup)
#             puts "To take the quiz one more time press enter. to exit press 1 and enter."
#             input = gets   
#         end
#     end
# end
