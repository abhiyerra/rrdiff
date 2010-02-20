require "tempfile"

module RRDiff
  module File
    # File interface to RRDiff
    
    def patch(delfile, file)
      newfile = Tempfile.new("newfile")
      RRDiff.patch(delfile.path, file.path, newfile.path)
      newfile
    end

    def signature(file)
      sigfile = Tempfile.new("sigfile")
      RRDiff.signature(file.path, sigfile.path)
      sigfile
    end

    def delta(sigfile, newfile)
      delfile = Tempfile.new("delfile")
      RRDiff.delta(newfile.path, sigfile.path, delfile.path)
      delfile
    end

    def diff(ofile, nfile)
    	sig = signature(ofile)
    	delta(sig, nfile)
    end
    extend self
  end
end