class Seaweedfs < Formula
  desc "SeaweedFS is a fast distributed storage system for blobs, objects, files, and data lake, for billions of files."
  homepage "https://github.com/seaweedfs/seaweedfs"
  version "3.67"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/seaweedfs/seaweedfs/releases/download/3.67/linux_amd64.tar.gz"
    sha256 "735698d3251d3cfc2860fed383847569422f22caba3d330dc86bae65713468d5"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/seaweedfs/seaweedfs/releases/download/3.67/darwin_arm64.tar.gz"
      sha256 "7223005668d3b16b47304e4a5672d2e08d41580dcd62fbe59e98a85bb6c3bc81"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/seaweedfs/seaweedfs/releases/download/3.67/darwin_amd64.tar.gz"
      sha256 "b06b664a658267971fcfb2b93ad4f9c4d4333393dfc2773fdb1919fa07c923dd"
    end
  end

  def install
    bin.install "weed"
  end
end
