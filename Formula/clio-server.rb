class ClioServer < Formula
  desc "An XRP Ledger API Server"
  homepage "https://github.com/XRPLF/clio"
  version "2.7.1"
  license "ISC"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    url "https://github.com/XRPLF/clio/releases/download/2.7.1/clio_server_Linux_Release_gcc.zip"
    sha256 "e74eb44d9e9d232753e5733bbf97ed68e28bf458682add9920acf9028fd6d5c4"
  end

  if OS.mac?
    url "https://github.com/XRPLF/clio/releases/download/2.7.1/clio_server_macOS_Release_apple-clang.zip"
    sha256 "71f2c3177f258cf72d2b6630f925617960944bcf9b760177ba3ede7f18c561e0"
  end

  def install
    bin.install "clio_server" => "clio-server"
  end
end
