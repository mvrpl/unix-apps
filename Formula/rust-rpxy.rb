class RustRpxy < Formula
  desc "A simple and ultrafast http reverse proxy serving multiple domain names and terminating TLS for http/1.1, 2 and 3, written in Rust"
  homepage "https://github.com/junkurihara/rust-rpxy"
  version "0.14.1"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/junkurihara/rust-rpxy/releases/download/0.14.1/rpxy-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "e41333606e7468359c368eddb2778fd6ab4c5d530b01d4710319e1a5602e6013"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/junkurihara/rust-rpxy/releases/download/0.14.1/rpxy-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "2edc0970d9976517577bc0447d0b42e9a46fd9481f126a2d40ffe4802cf2f728"
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
