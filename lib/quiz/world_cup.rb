class Quiz::Worldcup
    attr_accessor :winner, :year, :host, :runner_up, :thirth_place
    @@all = []
     def initialize(file)
        @@all << self
         file.each{|key,value|
         self.send("#{key}=", value)}
    end
    
    def self.world_cup_file(file)
        file.each{|e|Quiz::Worldcup.new(e)}  
    end
    def self.all
        @@all
    end
end