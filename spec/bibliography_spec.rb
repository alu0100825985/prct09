require 'spec_helper'
require 'bibliography'

describe Bibliography do
  before :each do
    @p1 = Bibliography.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide", "(The Facets of Ruby)", "Pragmatic Bookshelf", "4 edition", "July 7, 2013", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
  end 
    
  describe "Debe existir uno o más autores" do
    it "Existen uno o más autores" do
      @p1.author.should eq(["Dave Thomas", "Andy Hunt", "Chad Fowler"]) 
    end
  end
  
  describe "Debe existir un título" do
    it "Existe un título" do
      @p1.title.should eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide") 
    end
  end
  
  describe "Debe existir o no una serie" do
    it "Existe una serie" do
      @p1.series.should eq("(The Facets of Ruby)") 
    end
  end
  
end