class Glaredb < Formula
  desc "An analytics DBMS for distributed data"
  homepage "https://github.com/GlareDB/glaredb"
  version "25.5.5"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v25.5.5/glaredb-linux-x86_64"
      sha256 "750cee725d852a5112a773a141305d234d681a4752723a1c95a62cb5837f380e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v25.5.5/glaredb-linux-arm64"
      sha256 "029af117bfc10e5a5700c056500f90a93909ec8d7da799250b77c4a6ed58b68b"
    end
  end

  if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/GlareDB/glaredb/releases/download/v25.5.5/glaredb-macos-arm64"
    sha256 "2a1bb67d955bbab8a22897a894a894337ec542698b67bd4ac83b4691933ef83f"
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
