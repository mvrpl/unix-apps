class WrenAi < Formula
  desc "Open-source GenBI AI Agent that empowers data-driven teams to chat with their data to generate Text-to-SQL, charts, spreadsheets, reports, and BI"
  homepage "https://github.com/Canner/WrenAI"
  version "0.21.0"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.21.0/wren-launcher-linux.tar.gz"
    sha256 "b32657231d0cd99462b65867e904eb4a02eec3d3e778b43789dd1ffb1ac6193c"
  end

  if OS.mac? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.21.0/wren-launcher-darwin.tar.gz"
    sha256 "2ee2843b2e8e381342974cb65621797abfd84011de361d86429daee1c71d3051"
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
