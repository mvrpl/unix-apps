class WrenAi < Formula
  desc "Open-source GenBI AI Agent that empowers data-driven teams to chat with their data to generate Text-to-SQL, charts, spreadsheets, reports, and BI"
  homepage "https://github.com/Canner/WrenAI"
  version "0.15.3"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.15.3/wren-launcher-linux.tar.gz"
    sha256 "54f9f3aa0c4397c652b3b0b264805b480fe7daff73e29fbbf4bcd1229afe267c"
  end

  if OS.mac? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.15.3/wren-launcher-darwin.tar.gz"
    sha256 "43a02bd4ffb4933a65f377bae3c9aeea2c88bf7e24a698a3e4dd0bd54a547c3b"
  end

  def install
    if OS.linux? && Hardware::CPU.is_64_bit?
      bin.install "wren-launcher-linux" => "wren-ai"
    end
  
    if OS.mac? && Hardware::CPU.is_64_bit?
      bin.install "wren-launcher-darwin" => "wren-ai"
    end
  end
end
