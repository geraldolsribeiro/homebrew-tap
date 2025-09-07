class Microci < Formula
  desc "Minimalist continuous integration tool"
  homepage "https://microci.dev"
  url "https://github.com/geraldolsribeiro/microCI/archive/refs/tags/v0.40.2.tar.gz"
  sha256 "d7f25c5dc64cde6948f8bd6d639def2b2b138a55d3a5e9d09ee4fb1838dfba4e"
  license "MIT"
  head "https://github.com/geraldolsribeiro/microci.git", branch: "master"

  depends_on "gettext"
  depends_on "spdlog"
  depends_on "yaml-cpp"

  def install
    system "make", "-C", "src", "CXXFLAGS=-std=c++17 -DFMT_HEADER_ONLY -DSPDLOG_FMT_EXTERNAL=1 -I../include/"
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
    system "bin/microCI", "--version"
  end
end
