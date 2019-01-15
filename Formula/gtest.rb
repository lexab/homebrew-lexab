# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Gtest < Formula
  desc "Google Test framework"
  homepage "https://github.com/google/googletest"
  url "https://github.com/google/googletest/archive/release-1.8.1.tar.gz"
  version "1.8.1"
  sha256 "9bf1fe5182a604b4135edc1a425ae356c9ad15e9b23f9f12a02e80184c3a249c"
   head "https://github.com/google/googletest.git", :branch => "master", :tag => "release-1.8.1", :using =>:git 

  depends_on "cmake" => :build
  needs :cxx11
  def install
     ENV.deparallelize  # if your formula fails when building in parallel
#    system "git submodule init"
#    system "git submodule update"  
    # Remove unrecognized options if warned by configure
    args = std_cmake_args
    args << "-DCXXFLAGS=-std=c++14"
    #
    mkdir "build" do
	system "cmake", "..", *args
	system "cmake", "--build", ".", "-j", "4", "--target", "all"
	system "cmake", "--build", ".", "--target", "install/strip" 
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test log4cplus2`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
