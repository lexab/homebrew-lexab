# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Gbenchmark < Formula
  desc "A microbenchmark support library"
  homepage "https://github.com/google/benchmark"
  url "https://github.com/google/benchmark/archive/v1.4.1.tar.gz"
  sha256 "f8e525db3c42efc9c7f3bc5176a8fa893a9a9920bbd08cef30fb56a51854d60d"
  version "1.4.1"
  head "https://github.com/google/benchmark.git", :branch => "master", :tag => "v1.4.1", :using =>:git

  depends_on "cmake" => :build
  depends_on "gtest" => :build
  def install
    args = std_cmake_args
    args << "-DCXXFLAGS=-std=c++14" 
    args << "-DBENCHMARK_ENABLE_INSTALL=ON" 
    args << "-DBENCHMARK_ENABLE_GTEST_TESTS=ON"
        mkdir "build" do
        system "cmake", "..", *args
        system "cmake", "--build", ".", "-j", "4", "--target", "all"
        system "cmake", "--build", ".", "--target", "install/strip"
        end
#    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test benchmark`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
