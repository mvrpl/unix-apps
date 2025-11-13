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
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/XRPLF/rippled/archive/refs/tags/2.6.1.zip"
      sha256 "9d4f940282665eaf26edd93919a22b84d2bcd73500e9ee342dc5036de7248a14"
    end
  end

  def install
    system "conan", "config", "install", "conan/profiles/", "-tf", "$(conan config home)/profiles/"
    system "conan", "remote", "add", "--index", "0", "xrplf", "--force", "https://conan.ripplex.io"
    system "mkdir", ".build"
    system "cd", ".build"
    system "conan", "install", "..", "--output-folder", ".", "--build", "missing", "--settings", "build_type=Release"
    system "cmake", "-DCMAKE_TOOLCHAIN_FILE:FILEPATH=build/generators/conan_toolchain.cmake", "-DCMAKE_BUILD_TYPE=Release", "-Dxrpld=ON", "-Dtests=ON", ".."
    system "cmake", "--build", ".", "--config", "Release"

    bin.install "./.build/Release/rippled" => "rippled"
  end
end
