class Array
  def to_csv
    tmp = []
    
    for i in self
      # todo research case syntax, since these elsifs are ugly
      if i.is_a? Array
        tmp << i.join(',')
      elsif i.is_a? String
        tmp << i
      elsif i.is_a? Hash
        tmp << i.map{|k, v| "#{k}: #{v}"}.join(',')
      end
    end
    
    tmp.join("\n")
  end
end