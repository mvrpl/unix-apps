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

  depends_on "cmake" => :build
  depends_on "conan" => :build
  depends_on "protobuf" => :build
  depends_on "grpc" => :build
  depends_on "python@3.11"

  if OS.mac? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/XRPLF/rippled/archive/refs/tags/2.6.1.tar.gz"
    sha256 "b57c90e86dd32ef9ce00081fd348ec01f55131677dce7acba8b69939c1581466"
  end

  def install
    system "conan", "profile", "detect"
    system "conan", "remote", "add", "--force", "--index", "0", "xrplf", "https://conan.ripplex.io"

    mkdir ".build" do
      system "conan", "install", "..",
             "--output-folder", ".",
             "--build", "missing",
             "--settings", "build_type=Release"

      system "cmake", "-DCMAKE_TOOLCHAIN_FILE=build/generators/conan_toolchain.cmake",
                      "-DCMAKE_BUILD_TYPE=Release",
                      "-Dxrpld=ON",
                      "-Dtests=OFF",
                      ".."

      system "cmake", "--build", "."
    end

    bin.install "rippled"
  end
end
