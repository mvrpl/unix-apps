class Rippled < Formula
  desc "Decentralized cryptocurrency blockchain daemon implementing the XRP Ledger protocol"
  homepage "https://xrpl.org"
  version "2.6.1"
  license "ISC"

  livecheck do
    url 'https://github.com/XRPLF/rippled'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  depends_on "python"
  depends_on "conan"
  depends_on "cmake"
  depends_on "gcc"

  if OS.mac?
    url "https://github.com/XRPLF/rippled/archive/refs/tags/2.6.1.zip"
    sha256 "9d4f940282665eaf26edd93919a22b84d2bcd73500e9ee342dc5036de7248a14"
  end

  def install
    File.open("build.sh", "w") do |file|
      file.write("echo 'Building rippled ...' \n")
      file << "echo 'This may take a while. Please be patient.' \n"
    end

    bin.install "./.build/Release/rippled" => "rippled"
  end
end
