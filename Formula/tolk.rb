class Tolk < Formula
  desc "Tolk is a next-generation language for developing smart contracts on TON blockchain"
  homepage "https://github.com/ton-blockchain/ton"
  version "1.4.2"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/tolk-([\d\.]+)/i)
    strategy :github_latest
  end

  depends_on "node"

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.4.2/tolk-linux-arm64"
      sha256 "3c1b8f5d7264f9c3016771d394bf211a1a2616045bac3806f77be65da1d61055"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.4.2/tolk-linux-x86_64"
      sha256 "542869781fdb1dbf17524ac5d31e64e9e6e9125fb28c993c90cdd9d304437940"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.4.2/tolk-mac-arm64"
      sha256 "52c00e29aacfdd89a8bde02dba0b921ee29a8655e0166364c34da114e1e31740"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.4.2/tolk-mac-x86-64"
      sha256 "0662f47815a163a4d7dab14bfd2f8bb54d553c1539aa515e7994e3bf17e646ce"
    end
  end

  def install
    system "npm", "i", "--prefix", prefix, "@ton/tolk-js"

    stdlib_path = prefix/"node_modules/@ton/tolk-js/dist/tolk-stdlib"

    ohai "Set TOLK_STDLIB env var to #{stdlib_path} if needed"

    if OS.linux?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            bin.install "tolk-linux-arm64" => "tolk"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            bin.install "tolk-linux-x86_64" => "tolk"
        end
    end
    if OS.mac?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            bin.install "tolk-mac-arm64" => "tolk"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            bin.install "tolk-mac-x86-64" => "tolk"
        end
    end
  end
end
