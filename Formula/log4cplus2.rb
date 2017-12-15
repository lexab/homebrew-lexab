# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Log4cplus2 < Formula
  desc "Log2cplus v2"
  homepage "https://github.com/log4cplus/log4cplus/tree/REL_2_0_0-RC2"
  url "https://github.com/log4cplus/log4cplus/archive/REL_2_0_0-RC2.zip"
  version "2.0.0-RC2"
  sha256 "cf40f4daaf6072e22267dac5158843f5ee80d946de06b8e68221e7feb342e878"
    head "https://github.com/log4cplus/log4cplus.git", :branch => "2.0.x", :revision => "REL_2_0_0-RC2"
  # depends_on "cmake" => :build

  def install
     ENV.deparallelize  # if your formula fails when building in parallel
    system "git submodule init"
    system "git submodule update"  
    # Remove unrecognized options if warned by configure
    system "./configure", "--without-qt",
                        "--without-qt5",
                        "--without-python",
			"--with-working-locale",
                          "--prefix=#{prefix}",
			"CXXFLAGS=-std=c++14"
    # system "cmake", ".", *std_cmake_args
    system "make -j4"
    system "make install" # if this fails, try separate make/make install steps
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
