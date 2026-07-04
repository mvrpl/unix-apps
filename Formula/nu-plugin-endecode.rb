class NuPluginEndecode < Formula
  desc "Nushell plugin for more encoding schemes for encode and decode"
  homepage "https://github.com/kaathewisegit/nugins"
  version "0.113.1"
  license "MPL-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/kaathewisegit/nugins/releases/download/v0.113.1/nu_plugin_endecode-v0.113.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1bd8c6bb1543b3f1a33d169c1bce12cb842864beca5f7f7ae5100506928d0b18"
  end

  if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/kaathewisegit/nugins/releases/download/v0.113.1/nu_plugin_endecode-v0.113.1-aarch64-apple-darwin.tar.gz"
    sha256 "f4a3ac5026657b58322d0a5a4e0479b46f147314282f77a950a7c504c3ade7ee"
  end

  def install
    libexec.install Dir["*"]
    system "plugin", "add", "#{prefix}/libexec/nu_plugin_endecode"
  end
end
