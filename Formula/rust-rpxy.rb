class RustRpxy < Formula
  desc "A simple and ultrafast http reverse proxy serving multiple domain names and terminating TLS for http/1.1, 2 and 3, written in Rust"
  homepage "https://github.com/junkurihara/rust-rpxy"
  version "0.14.0"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/junkurihara/rust-rpxy/releases/download/0.14.0/rpxy-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "7a80e3c4936793288a3c9609230cb01409d50d5b57c78a7bac26ea35c3482a29"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/junkurihara/rust-rpxy/releases/download/0.14.0/rpxy-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "890fec9de4e02b97ace2eebe159f345f64b3b1189997e264c6d943da5bb08377"
    end
  end

  def install
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "rpxy-aarch64-unknown-linux-gnu" => "rrpxy"
    end
    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "rpxy-x86_64-unknown-linux-gnu" => "rrpxy"
    end
  end
end
