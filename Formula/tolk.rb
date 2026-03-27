class Tolk < Formula
  desc "Tolk is a next-generation language for developing smart contracts on TON blockchain"
  homepage "https://github.com/ton-blockchain/ton"
  version "1.3.0"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/tolk-([\d\.]+)/i)
    strategy :github_latest
  end

  depends_on "node"

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.3.0/tolk-linux-arm64"
      sha256 "c4c9e52daa8b31b5d9dbad7ecea4801929b8a66dbf9797c3841b8e6e6b43039b"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.3.0/tolk-linux-x86_64"
      sha256 "4bf385302474e32b5f19f6f2482e05496910e29254a0e76544ec1fc4ba2e8bcc"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.3.0/tolk-mac-arm64"
      sha256 "1b5aca495cae6ea9388b5aee64521065e295224872003258836b3ab072aa507c"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.3.0/tolk-mac-x86-64"
      sha256 "4fcd4c2a83679e261bf18d245d5dc93a46348045500504dcd25d2f51cca6a397"
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
