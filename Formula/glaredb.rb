class Glaredb < Formula
  desc "An analytics DBMS for distributed data"
  homepage "https://github.com/GlareDB/glaredb"
  version "0.10.3"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v0.10.3/glaredb-linux-x86_64"
      sha256 "a891d84f4bdabdd97ad4800c9f27fe361e4301e79bd99c8db2c29fd20c6580dc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v0.10.3/glaredb-linux-arm64"
      sha256 "e5c549af58162c2feb83b629c3022208e268802119d1bfd95ef0bf65f844f2fd"
    end
  end

  if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/GlareDB/glaredb/releases/download/v0.10.3/glaredb-macos-arm64"
    sha256 "b0c38f11a33d23a0a81d20d34ba6be12fba122307978196ec5b477fe42cbd0dc"
  end

  def install
    if OS.linux?
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "glaredb-linux-x86_64" => "glaredb"
      end
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "glaredb-linux-arm64" => "glaredb"
      end
      if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "glaredb-macos-arm64" => "glaredb"
      end
    end
    
  end
end
