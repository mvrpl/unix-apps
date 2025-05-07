class Glaredb < Formula
  desc "An analytics DBMS for distributed data"
  homepage "https://github.com/GlareDB/glaredb"
  version "25.5.2"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v25.5.2/glaredb-linux-x86_64"
      sha256 "da54fb073f8b8bf8e534629e50496b104274de0007196bf29b8ab343bb29a902"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v25.5.2/glaredb-linux-arm64"
      sha256 "212d4faa8d58e7446393b2173b8ff0119aa431df888af92545ddea1b6bf0b2b8"
    end
  end

  if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/GlareDB/glaredb/releases/download/v25.5.2/glaredb-macos-arm64"
    sha256 "8c95fa4704b8a0301725916fb2376119b20fcb1699beec0c2f8fd9d99b4de0a3"
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
