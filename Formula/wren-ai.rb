class WrenAi < Formula
  desc "Open-source GenBI AI Agent that empowers data-driven teams to chat with their data to generate Text-to-SQL, charts, spreadsheets, reports, and BI"
  homepage "https://github.com/Canner/WrenAI"
  version "0.29.1"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.29.1/wren-launcher-linux.tar.gz"
    sha256 "3dd8ff829387644b21452f3ce3438236a7d5e608b46c8be20dbc4b93b2aa8916"
  end

  if OS.mac? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.29.1/wren-launcher-darwin.tar.gz"
    sha256 "cac558a3af056920aaa2cf7cafd3ed1840d562994a3fe46879251df7f39012e8"
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
