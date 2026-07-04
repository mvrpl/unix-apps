class NuPluginTemplate < Formula
  desc "Nushell plugin for string and HTML templating"
  homepage "https://github.com/kaathewisegit/nugins"
  version "0.113.1"
  license "MPL-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/kaathewisegit/nugins/releases/download/v0.113.1/nu_plugin_template-v0.113.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2d7a5565e8c4f3a5dbb2b7f5e18fa61a1ecc040316c97c36dfd7dfdab1a3cf59"
  end

  if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/kaathewisegit/nugins/releases/download/v0.113.1/nu_plugin_template-v0.113.1-aarch64-apple-darwin.tar.gz"
    sha256 "10da60d781783f74c22a75e67174bf493ddbbf30fdff798925c7f21357f96108"
  end

  def install
    libexec.install Dir["*"]
    system "nu", "-c", "plugin add \"#{prefix}/libexec/nu_plugin_template\""
  end
end
