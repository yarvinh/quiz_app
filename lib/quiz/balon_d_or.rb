class Quiz::BALONDOR
    attr_accessor :winner, :year, :host, :runner_up
    @@all = []
     def initialize(file)
        @@all << self
         file.each{|key,value|
         self.send("#{key}=", value)}
    end
    def self.balon_d_or(file)
        file.each{|e|Quiz::BALONDOR.new(e)}  
    end
    def self.all
        @@all
    end 
end
