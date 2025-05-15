class Glaredb < Formula
  desc "An analytics DBMS for distributed data"
  homepage "https://github.com/GlareDB/glaredb"
  version "25.5.6"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v25.5.6/glaredb-linux-x86_64"
      sha256 "0a2f1deaa2fd81e78e5a0368fa749953b6961385d092a662728e305e4a0be2fb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v25.5.6/glaredb-linux-arm64"
      sha256 "d4e85c45aebf649276c68490f3064666a37b99a99593bd420a1b1adf2ab85aed"
    end
  end

  if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/GlareDB/glaredb/releases/download/v25.5.6/glaredb-macos-arm64"
    sha256 "9a31924b2328daf5d42a86d80a3d4594841b44d200de2e1c6131f0999e3529a4"
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
