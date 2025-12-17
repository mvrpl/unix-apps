class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.13.1"
  license "Apache-2.0"

  livecheck do
    url 'https://api.github.com/repos/iotaledger/iota/releases'
    regex(/^v([\d\.]+)$/i)
    strategy :json do |json, regex|
      json.map do |release|
        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on "postgresql"
  depends_on "libpq"

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.13.1/iota-v1.13.1-linux-arm64.tgz"
      sha256 "310a35dc4bd04f02ad8083b02a1bfba69c6abb71b86b1d9ca91eb0c223649689"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.13.1/iota-v1.13.1-linux-x86_64.tgz"
      sha256 "57d73388ce85be074aa54aa7f77ab5fda40eaeab0a6be4591973a9cb8efcde7f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.13.1/iota-v1.13.1-macos-arm64.tgz"
      sha256 "f414d9320285bdd8cfa462d28cc8bcfd5a238f75faeb5f816f6b6e1beb454ad2"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
