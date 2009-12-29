require File.join(File.dirname(__FILE__),'..','ext','RRDiff')

describe RRDiff do
  it "should create a signature from an oldfile" do
    RRDiff.signature("oldfile", "sigfile").should == 0
  end
end
