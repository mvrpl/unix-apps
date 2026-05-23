class Tolk < Formula
  desc "Tolk is a next-generation language for developing smart contracts on TON blockchain"
  homepage "https://github.com/ton-blockchain/ton"
  version "1.4.1"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/tolk-([\d\.]+)/i)
    strategy :github_latest
  end

  depends_on "node"

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.4.1/tolk-linux-arm64"
      sha256 "7cad325c7827bd4d1239f294051a53816998cb5b8de67d92c9e43a2a8abb7213"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.4.1/tolk-linux-x86_64"
      sha256 "4696c724bcac452d260cae35445c580a3a5e01ccf00d92dff1a595492c76e315"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.4.1/tolk-mac-arm64"
      sha256 "636503bb9d14d5cfe09fee8108bb6a5e179c5a5013404ba462ef16925ca43635"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ton-blockchain/ton/releases/download/tolk-1.4.1/tolk-mac-x86-64"
      sha256 "c7ce0f9c501d82b7e0ea417798535c92e34fef0f995fcce3229683dee02133c1"
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
