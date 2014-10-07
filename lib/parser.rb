require "csv"

class Parser
    def self.load_file(filepath = "data/")
      contents = CSV.open(filepath, headers: true, header_converters: :symbol)
    end

end
