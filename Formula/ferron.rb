class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.4"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.4/ferron-1.3.4-aarch64-unknown-linux-gnu.zip"
      sha256 "fc4f698dcbce301c69a0a778766a0c13e8641edfc3db4cc63a6905f0df012ab2"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.4/ferron-1.3.4-x86_64-unknown-linux-gnu.zip"
      sha256 "18b9605e97bb0c48c5d86905c3cf7bc37a5b21c34b6778bd160eb0e28295b9ba"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.4/ferron-1.3.4-aarch64-apple-darwin.zip"
      sha256 "da27035448d70e76a399d64f8c7cc0555249dac9ccb04067a385ba4c984c5be4"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.4/ferron-1.3.4-x86_64-apple-darwin.zip"
      sha256 "2d78adf2ce3d9a495a92a7a484c40e553744c03f34de61918c245e06257d1fea"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
