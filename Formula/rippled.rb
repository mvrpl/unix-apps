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
    if OS.mac?
      (bin/"build.zsh").write <<~SH
        #!/bin/zsh
        conan config install conan/profiles/ -tf $(conan config home)/profiles/
        conan remote add --index 0 xrplf --force https://conan.ripplex.io
        mkdir .build && cd .build
        conan install .. --output-folder . --build missing --settings build_type=Release
        cmake -DCMAKE_TOOLCHAIN_FILE:FILEPATH=build/generators/conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release -Dxrpld=ON -Dtests=ON ..
        cmake --build . --config Release
      SH
      system "chmod", "+x", bin/"build.zsh"
      ohai "Running build script..."
      system bin/"build.zsh"
    end

    bin.install "./.build/Release/rippled" => "rippled"
  end
end
