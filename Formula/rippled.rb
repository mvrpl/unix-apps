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
  depends_on "grpc"

  if OS.mac?
    url "https://github.com/XRPLF/rippled/archive/refs/tags/2.6.1.tar.gz"
    sha256 "b57c90e86dd32ef9ce00081fd348ec01f55131677dce7acba8b69939c1581466"
  end

  def install
    if OS.mac?
      Dir.mkdir("buildd")
      Dir.chdir("buildd") do
        grpc = Formula["grpc"]
        args = %W[
          -DWITH_GRPC_INCLUDEDIR=#{grpc.opt_include}
          -DWITH_GRPC_LIBDIR=#{grpc.opt_lib}
          -DCMAKE_INSTALL_BINDIR=bin
          -DCMAKE_INSTALL_LIBDIR=lib
          -DCMAKE_INSTALL_INCLUDEDIR=include
        ]
        system "conan", "profile", "detect", "--force"
        system "conan", "remote", "add", "--index", "0", "xrplf", "--force", "https://conan.ripplex.io"
        system "conan", "install", "..", "--output-folder", ".", "--build", "missing", "--settings", "build_type=Release"
        system "cmake", "-DCMAKE_TOOLCHAIN_FILE:FILEPATH=build/generators/conan_toolchain.cmake", "-DCMAKE_BUILD_TYPE=Release", "-Dxrpld=ON", "-Dtests=ON", ".."
        system "cmake", "--build", ".", "--config", "Release", *args, *std_cmake_args
      end
    end

    bin.install "./buildd/Release/rippled" => "rippled"
  end
end
