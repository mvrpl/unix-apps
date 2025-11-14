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
  depends_on "pkg-config" => :build
  depends_on "python@3.11"
  depends_on "llvm"
  depends_on "openssl@3"
  depends_on "protobuf"

  if OS.mac?
    url "https://github.com/XRPLF/rippled/archive/refs/tags/2.6.1.tar.gz"
    sha256 "b57c90e86dd32ef9ce00081fd348ec01f55131677dce7acba8b69939c1581466"
  end

  def install
    ENV["CC"] = Formula["llvm"].opt_bin/"clang"
    ENV["CXX"] = Formula["llvm"].opt_bin/"clang++"

    system "conan", "profile", "detect"
    system "conan", "remote", "add", "--force", "--index", "0", "xrplf", "https://conan.ripplex.io"

    mkdir "build" do
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
