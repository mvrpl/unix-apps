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
  depends_on "conan" => :build
  depends_on "cmake" => :build
  depends_on "gcc" => :build

  if OS.mac?
    url "https://github.com/XRPLF/rippled/archive/refs/tags/2.6.1.tar.gz"
    sha256 "b57c90e86dd32ef9ce00081fd348ec01f55131677dce7acba8b69939c1581466"
  end

  def install
    if OS.mac?
      system "cd", "rippled-*"
      system "conan", "config", "install", "conan/profiles/", "-tf", "$(conan config home)/profiles/"
      system "conan", "remote", "add", "--index", "0", "xrplf", "--force", "https://conan.ripplex.io"
      system "mkdir", ".build"
      system "cd", ".build"
      system "conan", "install", "..", "--output-folder", ".", "--build", "missing", "--settings", "build_type=Release"
      system "cmake", "-DCMAKE_TOOLCHAIN_FILE:FILEPATH=build/generators/conan_toolchain.cmake", "-DCMAKE_BUILD_TYPE=Release", "-Dxrpld=ON", "-Dtests=ON", ".."
      system "cmake", "--build", ".", "--config", "Release"
    end

    bin.install "./.build/Release/rippled" => "rippled"
  end
end
