module ActsAsCsv
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    def each(&block)
    	@csv_contents.each do |row|
			r = Row.new(@headers, row)
			block.call r
		end
    end

    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end
    
  end
  
end

class Row
	@header = []
	@row = []

	def method_missing name, *args
		row_index = @header.index(name.to_s)
		throw "NoMatchError" unless row_index

		@row[row_index]
	end

	def initialize(header, row)
		@header = header
		@row    = row
	end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

RubyCsv.new.each {|r| puts r.one}
