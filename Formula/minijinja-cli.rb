class MinijinjaCli < Formula
  desc "MiniJinja is a powerful but minimal dependency template engine for Rust compatible with Jinja/Jinja2"
  homepage "https://docs.rs/minijinja/latest/minijinja"
  version "2.9.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/mitsuhiko/minijinja'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mitsuhiko/minijinja/releases/download/2.9.0/minijinja-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3e077564599650804e541374363c029f34389b7750fd959ddb91526294e34845"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mitsuhiko/minijinja/releases/download/2.9.0/minijinja-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2339e1a517fc00807116d3745711e018ede207938aa69ab3464c2c0d9aedea0d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mitsuhiko/minijinja/releases/download/2.9.0/minijinja-cli-aarch64-apple-darwin.tar.xz"
      sha256 "249d76e389ab4cbf8ad06693e85628faa2eed64459075848202cf0ae834eb8fe"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mitsuhiko/minijinja/releases/download/2.9.0/minijinja-cli-x86_64-apple-darwin.tar.xz"
      sha256 "5b76cb258ad30d9edc691ff4636e476b73d5be4e4d3e7d0c1e44bde2ecd1da0f"
    end
  end

  def install
    bin.install "minijinja-cli"  => "minijinja"
  end
end
