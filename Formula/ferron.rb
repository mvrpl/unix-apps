class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.0"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.0/ferron-1.3.0-aarch64-unknown-linux-gnu.zip"
      sha256 "f40c87e14f0dcdb3be4f19b2b03b67c9ec6d3b3b16f19de3e23a2f9c1528bd7e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.0/ferron-1.3.0-x86_64-unknown-linux-gnu.zip"
      sha256 "399c6439cb9834b25d1e78cc9699423616513b13422c95931489199280c5c221"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.0/ferron-1.3.0-aarch64-apple-darwin.zip"
      sha256 "2178060e28047c9022b2228845414b156f9793d61194c3d01f276bf68001a987"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.0/ferron-1.3.0-x86_64-apple-darwin.zip"
      sha256 "21c1080db69f913048d223fc03c9135258fab937cec2d9886769d18a48828229"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
