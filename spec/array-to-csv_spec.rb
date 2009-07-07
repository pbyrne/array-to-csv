require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

# TODO replace the it declarations with more meaningful and descriptive, er, descriptions
describe Array do
  context "managing converting itself to CSV format" do
    it "returns '' on an emtpy array" do
      data = []
      
      data.to_csv.should == ""
    end
    
    it "returns 'a\nb\nc' for an array ['a', 'b', 'c']" do
      data = ['a', 'b', 'c']
      
      data.to_csv.should == %Q("a"\n"b"\n"c")
    end
    
    it "returns 'a,b\nc,d' for an array [['a', 'b'], ['c', 'd']]" do
      data = [['a', 'b'], ['c', 'd']]
      
      data.to_csv.should == %Q("a","b"\n"c","d")
    end
    
    it "returns 'a: b\nc: d' for an array [{:a => 'b'}, {:c => 'd'}]" do
      data = [{:a => 'b'}, {:c => 'd'}]
      
      data.to_csv.should == %Q("a: b"\n"c: d")
    end
    
    it "returns 'Patrick,2009-09-13\nAngela,2009-08-17' for an array [['Patrick', Date.new(2009,9,13)], ['Angela', Date.new(2009,8,17)]]" do
      data = [['Patrick', Date.new(2009,9,13)], ['Angela', Date.new(2009,8,17)]]
      
      data.to_csv.should == %Q("Patrick","2009-09-13"\n"Angela","2009-08-17")
    end
    
    context "managing the escaping of double quotes in the cells" do
      it "correctly escapes double quotes in nested arrays" do
        data = [["a href=\"foo\"", "div"], ["link rel=\"bar\"","blockquote"]]

        data.to_csv.should == %Q("a href=""foo""","div"\n"link rel=""bar""","blockquote")
      end
      
      it "correctly escapes double quotes in strings" do
        data = ["a href=\"foo\"", "link rel=\"bar\""]
        
        data.to_csv.should == %Q("a href=""foo"""\n"link rel=""bar""")
      end
      
      it "correctly escapes double quotes in hashes" do
        data = [{ :url => 'a href="foo"', :style => 'link rel="bar"'}]
        
        data.to_csv.should == %Q("url: a href=""foo""","style: link rel=""bar""")
      end
    end
  end
end

describe String do
  context "handling escaping double quotes in CSV" do
    it "returns empty string when escaping an empty string" do
      "".escape_csv_quotes.should == ""
    end
    
    it "returns the origal string if doesn't have any double-quotes" do
      "foo".escape_csv_quotes.should == "foo"
    end
    
    it "returns two double quotes for every double quote" do
      'a href="foo"'.escape_csv_quotes.should == 'a href=""foo""'
    end
  end
end
