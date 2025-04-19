class WrenAi < Formula
  desc "Open-source GenBI AI Agent that empowers data-driven teams to chat with their data to generate Text-to-SQL, charts, spreadsheets, reports, and BI"
  homepage "https://github.com/Canner/WrenAI"
  version "0.20.0"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.20.0/wren-launcher-linux.tar.gz"
    sha256 "771da5b82b7032ee03c93d4d1818418d14836d6771af6fc08ab9573dd707709a"
  end

  if OS.mac? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.20.0/wren-launcher-darwin.tar.gz"
    sha256 "eca0f5a77ed526566b0ae567dea8b073ee19e51c1141d5609c498f2482e772e9"
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
