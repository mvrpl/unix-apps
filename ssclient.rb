class Ssclient < Formula
  desc "A simple, encrypted, git-friendly, file-backed secrets manager for rust"
  homepage "https://github.com/neosmart/securestore-rs"
  version "0.100.0"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/neosmart/securestore-rs/releases/download/0.100.0/ssclient-0.100.0-linux.tar.gz"
    sha256 "c4b19f3ed5e710ac5059430a1abf932e193bb6309cd6b7d5ddd5c716186a8442"
  end

  def install
    bin.install "ssclient"
  end
end
