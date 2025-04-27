class Glaredb < Formula
  desc "An analytics DBMS for distributed data"
  homepage "https://github.com/GlareDB/glaredb"
  version "0.10.12"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v0.10.12/glaredb-linux-x86_64"
      sha256 "dbeaafb38d329119188e80c5e0ea50ceaef658f7b0d0e13228751f76d8073d8a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v0.10.12/glaredb-linux-arm64"
      sha256 "d06cbeae0b81fb2f47c0183b4a0790ea4776053193e85d4b775526557f705c1f"
    end
  end

  if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/GlareDB/glaredb/releases/download/v0.10.12/glaredb-macos-arm64"
    sha256 "4c42902bf386822460954db57ea0eb737931df6a250750133998690503527cd4"
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
