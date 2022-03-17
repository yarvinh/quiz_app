#scraper Class
class Quiz::Scraper


    def self.scraper(url,clas)
        doc = Nokogiri::HTML(open(url))
        doc.css(clas)
    end

    def self.balon_d_or_players
        balon_d_or_url = "https://www.goal.com/es/noticias/todos-los-ganadores-del-balon-de-oro/wn19xivn1eh91t0jrslbzz5kq"
        balon_de_or_files = "table"

        players = self.scraper(balon_d_or_url,balon_de_or_files).map{|l|l.text}
        years = players[1].split(/\D/).reject{|e|e.empty?}
        years[1] = "2020"
        players = players[1].split(/\d/).reject{|e|e.empty?}
        players[0] = "Lionel Messi"
        players[1] = "Event was Cancel because Covi-19"
        counter = 0
        all_players = []
        while counter < players.size
            all_players << {:winner => players[counter],:year => years[counter]}
            counter += 1
        end

           p all_players
    end

  
    def self.world_cup
        world_cup_url = "https://www.foxsports.com/soccer/fifa-world-cup/history"
        world_cup = "tbody"
        world_cup = self.scraper(world_cup_url,world_cup).map{|l|l.text.split(/\r\n|\s{2,}/).reject{|e|e.empty?}}
        counter = 0 
        all_countries = []
        while counter < world_cup[0].size
            all_countries << {:year => world_cup[0][counter], :host => world_cup[0][counter + 1], :winner => world_cup[0][counter + 2], :runner_up => world_cup[0][counter + 3], :thirth_place => world_cup[0][counter + 4]}
            counter += 9
       end
       all_countries
    end

   def self.champion_league
        champion_league_url = "https://en.wikipedia.org/wiki/List_of_European_Cup_and_UEFA_Champions_League_finals"
        champion_league_file  = "tbody"
        
        champions = self.scraper(champion_league_url,champion_league_file).map{|l|l.text.split("\n").reject{|e|e.empty?}}
        champions[0].shift
        champions.shift
        champions.shift
        10.times{champions[0].shift}
        23.times{champions[0].pop}
        2.times{champions[0].delete_at(152)}
        counter = 0
        all_teams = []
        while  counter < champions[0].size
           all_teams << {:year => champions[0][counter], :winner => champions[0][counter + 2], :score => champions[0][counter + 3], :runner_up => champions[0][counter + 5], :host => champions[0][counter + 6]} 
           counter += 8                       
        end
         all_teams
   end
end

