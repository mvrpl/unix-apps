class Rcon < Formula
  desc "RCON client for executing queries on game server"
  homepage "https://github.com/gorcon/rcon-cli"
  version "0.10.3"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz"
    sha256 "6962a641ebf9a5957bd0cda1b8acf3e34a23686ae709f6c6a14ac3898521a5cc"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-arm64_darwin.tar.gz"
      sha256 "71d1687c41477b18218ab71333c7476d398e2db55166955fc0c2775b712b7a55"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_darwin.tar.gz"
      sha256 "ee8c99eb3de0dba89b2ba096f0d7debc5fb1eb117d6291a6d28e40ff59c54683"
    end
  end

  def install
    bin.install "rcon"
  end
end
