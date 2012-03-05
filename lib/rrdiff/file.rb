require "tempfile"

module RRDiff
  module File
    # File interface to RRDiff
    
    def patch(ofile, dfile)
      nfile = Tempfile.new("nfile")
      RRDiff.patch(ofile.path, dfile.path, nfile.path)
      nfile
    end

    def signature(file)
      sfile = Tempfile.new("sigfile")
      RRDiff.signature(file.path, sfile.path)
      sfile
    end

    def delta(sfile, file)
      dfile = Tempfile.new("delfile")
      RRDiff.delta(file.path, sfile.path, dfile.path)
      dfile
    end

    def diff(ofile, nfile)
    	sfile = signature(ofile)
    	delta(sfile, nfile)
    end
    extend self
  end
end