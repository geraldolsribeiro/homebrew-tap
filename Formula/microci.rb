class Microci < Formula
  desc "Minimalist continuous integration tool"
  homepage "https://microci.dev"
  url "https://github.com/geraldolsribeiro/microCI/archive/refs/tags/v0.40.1.tar.gz"
  #sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"
  head "https://github.com/geraldolsribeiro/microci.git", branch: "master"

  depends_on "inja"
  depends_on "spdlog"
  depends_on "yaml-cpp"

  def install
    system "make", "-C", "src", "CXXFLAGS=-std=c++17 -DFMT_HEADER_ONLY -DSPDLOG_FMT_EXTERNAL=1 -I/opt/homebrew/Cellar/inja/3.4.0/include/inja -I../include/"
    bin.mkpath
    bin.install "bin/microCI"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test microCI`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
