require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Dumpasn1 < Formula
  homepage "http://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c"
  url "http://ftp.de.debian.org/debian/pool/main/d/dumpasn1/dumpasn1_20130608.orig.tar.gz"
  sha1 "a9f1df49612dffda87563ea7b93633e3068b1f7e"

  # depends_on "cmake" => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "cc -o dumpasn1 dumpasn1.c"
    bin.install 'dumpasn1'
    etc.install 'dumpasn1.cfg'

    # system "cmake", ".", *std_cmake_args
    # system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test dumpasn1`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "printf \"\f\x03foo\" | #{bin}/dumpasn1 - 2>/dev/null |egrep \"0\s+3:\s+UTF8String\s+'foo'\""
  end
end
