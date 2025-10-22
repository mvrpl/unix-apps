class ClioServer < Formula
  desc "An XRP Ledger API Server"
  homepage "https://github.com/XRPLF/clio"
  version "2.6.0"
  license "ISC"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    url "https://github.com/XRPLF/clio/releases/download/2.6.0/clio_server_Linux_Release_gcc.zip"
    sha256 "689c0f13399fb79ceb68fbfcea77b3b2a08ca7c6f73a0aad160920b8efa5b063"
  end

  if OS.mac?
    url "https://github.com/XRPLF/clio/releases/download/2.6.0/clio_server_macOS_Release_apple-clang.zip"
    sha256 "72fcf85b8ff89e113d1ef13504fb33c433ec075e6e1639bcd4f09a0f3aa46e02"
  end

  def install
    bin.install "clio_server" => "clio-server"
  end
end
