class ClioServer < Formula
  desc "An XRP Ledger API Server"
  homepage "https://github.com/XRPLF/clio"
  version "2.8.0"
  license "ISC"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    url "https://github.com/XRPLF/clio/releases/download/2.8.0/clio_server_Linux_Release_gcc.zip"
    sha256 "8710693535668c2db738f99dd626783a1f8815080e72fa80ce71560bb5403070"
  end

  if OS.mac?
    url "https://github.com/XRPLF/clio/releases/download/2.8.0/clio_server_macOS_Release_apple-clang.zip"
    sha256 "35124edcf8c05839e8878e232ae8cd897999e51dc620098fecdfb8f2980ced20"
  end

  def install
    bin.install "clio_server" => "clio-server"
  end
end
