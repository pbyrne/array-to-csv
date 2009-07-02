require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Array do
  context "managing converting itself to CSV format" do
    it "returns '' on an emtpy array" do
      data = []
      
      data.to_csv.should == ""
    end
    
    it "returns 'a\nb\nc' for an array ['a', 'b', 'c']" do
      data = ['a', 'b', 'c']
      
      data.to_csv.should == "a\nb\nc"
    end
    
    it "returns 'a,b\nc,d' for an array [['a', 'b'], ['c', 'd']]" do
      data = [['a', 'b'], ['c', 'd']]
      
      data.to_csv.should == "a,b\nc,d"
    end
    
    it "returns 'a: b\nc: d' for an array [{:a => 'b'}, {:c => 'd'}]" do
      data = [{:a => 'b'}, {:c => 'd'}]
      
      data.to_csv.should == "a: b\nc: d"
    end
    
    it "returns 'Patrick,2009-09-13\nAngela,2009-08-17' for an array [['Patrick', Date.new(2009,9,13)], ['Angela', Date.new(2009,8,17)]]" do
      data = [['Patrick', Date.new(2009,9,13)], ['Angela', Date.new(2009,8,17)]]
      
      data.to_csv.should == "Patrick,2009-09-13\nAngela,2009-08-17"
    end
  end
end