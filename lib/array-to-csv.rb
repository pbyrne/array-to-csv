require "array-to-csv/version"

module ArrayToCsv
end

module Enumerable
  def to_csv
    tmp = []

    for i in self
      # todo research case syntax, since these elsifs are ugly
      # todo investigate switching to %Q syntax to make less ugly
      # todo refactor out the duplicate gsubs
      if i.is_a? Array
        tmp << i.map{|x| "\"#{x.to_s.escape_csv_quotes}\""}.join(',')
      elsif i.is_a? String
        tmp << "\"#{i.escape_csv_quotes}\""
      elsif i.is_a? Hash
        tmp << i.map{|k, v| "\"#{k.to_s.escape_csv_quotes}: #{v.to_s.escape_csv_quotes}\""}.join(',')
      end
    end

    tmp.join("\n")
  end
end

class String
  def escape_csv_quotes
    gsub('"','""')
  end
end
