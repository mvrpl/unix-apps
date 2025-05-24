class Glaredb < Formula
  desc "An analytics DBMS for distributed data"
  homepage "https://github.com/GlareDB/glaredb"
  version "25.5.10"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v25.5.10/glaredb-linux-x86_64"
      sha256 "39600ab992158fcea0fc9fc7087edb432dfe3609a14543fcf5127b1c9bac33a3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v25.5.10/glaredb-linux-arm64"
      sha256 "cce3fea1aa4b8a582c034d7845ee2d848febe0f3409b985945d0777dc63a7e49"
    end
  end

  if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/GlareDB/glaredb/releases/download/v25.5.10/glaredb-macos-arm64"
    sha256 "3793eaf5c32386d97a54d356f2b3b84eb8b6a2163dcf0e9ff791a717d2844aaa"
  end

  def install
    if OS.linux?
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "glaredb-linux-x86_64" => "glaredb"
      end
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "glaredb-linux-arm64" => "glaredb"
      end
    end
    if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      bin.install "glaredb-macos-arm64" => "glaredb"
    end
  end
end
