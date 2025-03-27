class Gossm < Formula
  desc "Interactive CLI tool that you can connect to ec2 using commands same as start-session, ssh in AWS SSM Session Manager"
  homepage "https://github.com/gjbae1212/gossm"
  version "1.5.0"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gjbae1212/gossm/releases/download/v1.5.0/gossm_1.5.0_Linux_arm64.tar.gz"
      sha256 "f469c797d88f6e793559fd184b069669099b2a19b123d5cc228123e55432e402"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gjbae1212/gossm/releases/download/v1.5.0/gossm_1.5.0_Linux_x86_64.tar.gz"
      sha256 "dffcb2b55f77ccc32446b93d0566f2b73178216fa1e5b00a21b1ea6e5a5928c0"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gjbae1212/gossm/releases/download/v1.5.0/gossm_1.5.0_Darwin_arm64.tar.gz"
      sha256 "734169bc61b7cdbf0ea93b1f07322b0ddb30abb8a2881506f82d580191e39d9a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gjbae1212/gossm/releases/download/v1.5.0/gossm_1.5.0_Darwin_x86_64.tar.gz"
      sha256 "0b19236b8d7b5a77e54aa84ed26d32e4e7cf6b5aee1e2d1a744081d475c75c3b"
    end
  end

  def install
    bin.install "gossm"
  end
end
