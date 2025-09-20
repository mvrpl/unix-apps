class Tolk < Formula
  desc "Tolk is a next-generation language for developing smart contracts on TON blockchain"
  homepage "https://github.com/ton-blockchain/ton"
  version "1.1.0"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/tolk-([\d\.]+)/i)
    strategy :github_latest
  end

  depends_on "node"

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.1.0/tolk-linux-arm64"
      sha256 "10eae7d06793441e9a76ac372ba3a2bf4015baf69985a7b35c2a2ae1162ecd6a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.1.0/tolk-linux-x86_64"
      sha256 "2dd94a27049a0083ca6c268fccd6bcbb421ad6a8ee59d6a199dffdf81fdc3d7a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.1.0/tolk-mac-arm64"
      sha256 "d7e817c4ae81e48275ebe954e4ef76f22d445e676d25a1664147b59e8866a526"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.1.0/tolk-mac-x86-64"
      sha256 "8919c761021ae4b44840a5ae25559b9163bf90231f47b90000274c7f2032fbb2"
    end
  end

  def install
    system "npm", "i", "@ton/tolk-js"

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
