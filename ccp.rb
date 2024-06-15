class Ccp < Formula
  desc "Chat Copy Protocol written in Rust"
  homepage "https://github.com/mvrpl/ccp"
  version "0.1.2"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  url "https://github.com/mvrpl/ccp/archive/refs/tags/0.1.2.tar.gz"
  sha256 "405c9d84d112f8851d31731c60eae089a0b3af6844a167c3dd65d128055b331a"

  depends_on "rustup" => :build
  depends_on "perl" => :build
  depends_on "openssl"

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/ccp"  => "ccp"
  end
end
