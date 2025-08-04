class Nomino < Formula
  desc "Batch rename utility for developers"
  homepage "https://github.com/yaa110/nomino"
  version "1.6.3"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/yaa110/nomino/releases/download/v1.6.3/nomino-linux-64bit"
    sha256 "c844809fb90a7a36c97c76798b8ec116d0f30f9f46ef1a60908cab43dc6ccdc5"
  end

  if OS.mac? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/yaa110/nomino/releases/download/v1.6.3/nomino-macos-64bit"
    sha256 "298ada9ed1c1061a55a07b0dca245a615a25e5e54cbb1b3feb91fcf0209fbe15"
  end

  def install
    if OS.linux?
      bin.install "nomino-linux-64bit" => "nomino"
    end
    if OS.mac?
      bin.install "nomino-macos-64bit" => "nomino"
    end
  end
end
