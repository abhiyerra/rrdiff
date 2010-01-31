require File.join(File.dirname(__FILE__),'..','ext','RRDiff')

describe RRDiff do
  it "should create a signature from an oldfile" do
    RRDiff.signature("oldfile", "sigfile")

    correct_sig_file = open("sigfile.correct", "rb")
    new_sig_file = open("sigfile", "rb")

    correct_sig_file.read.should == new_sig_file.read
  end

  it "show create a delta" do
    RRDiff.delta("newfile", "sigfile", "deltafile")

    correct_delta_file = open("deltafile.correct", "rb")
    new_delta_file = open("deltafile", "rb")

    correct_delta_file.read.should == new_delta_file.read
  end

  it "show patch the oldfile and create a patched file" do
    RRDiff.patch("oldfile", "deltafile", "patchedfile")

    correct_patched_file = open("newfile", "rb")
    new_patched_file = open("patchedfile", "rb")

    correct_patched_file.read.should == new_patched_file.read
  end
end
