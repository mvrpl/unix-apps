class ClioServer < Formula
  desc "An XRP Ledger API Server"
  homepage "https://github.com/XRPLF/clio"
  version "2.7.0"
  license "ISC"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    url "https://github.com/XRPLF/clio/releases/download/2.7.0/clio_server_Linux_Release_gcc.zip"
    sha256 "f5bae504b6b002f8ea04ea01325c87c9520507c71226c03cfca7e8f8ee694ea3"
  end

  if OS.mac?
    url "https://github.com/XRPLF/clio/releases/download/2.7.0/clio_server_macOS_Release_apple-clang.zip"
    sha256 "7649ad0bd8af7be4b980dbc4c7b5901fc3d4af63f62c744e675da4a6f334b4aa"
  end

  def install
    bin.install "clio_server" => "clio-server"
  end
end
