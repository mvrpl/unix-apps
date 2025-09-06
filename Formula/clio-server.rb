class ClioServer < Formula
  desc "An XRP Ledger API Server"
  homepage "https://github.com/XRPLF/clio"
  version "2.5.0"
  license "ISC"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    url "https://github.com/XRPLF/clio/releases/download/2.5.0/clio_server_Linux_Release_gcc.zip"
    sha256 "3be1349b1bd779fe35399072832d1bf58f7361bb428e57d6b1a882eeea4e3705"
  end

  if OS.mac?
    url "https://github.com/XRPLF/clio/releases/download/2.5.0/clio_server_macOS_Release_apple-clang.zip"
    sha256 "8c7b4f82750470591a06cd21c2d56124d01c26d268d1c93381cc57e2973f0678"
  end

  def install
    bin.install "clio_server" => "clio-server"
  end
end
