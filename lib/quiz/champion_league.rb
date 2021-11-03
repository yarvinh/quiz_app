class Quiz::CHAMPIONLEAGUE
    attr_accessor :year, :winner, :runner_up, :host, :score
    @@all = []
     def initialize(file)
        @@all << self
         file.each{|key,value|
         self.send("#{key}=", value)}
      
    end
    def self.champion_league_files(file)
        file.each{|e|Quiz::CHAMPIONLEAGUE.new(e)}  
    end
    def self.all
        @@all
    end
end