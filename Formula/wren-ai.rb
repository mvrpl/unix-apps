class WrenAi < Formula
  desc "Open-source GenBI AI Agent that empowers data-driven teams to chat with their data to generate Text-to-SQL, charts, spreadsheets, reports, and BI"
  homepage "https://github.com/Canner/WrenAI"
  version "0.23.0"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.23.0/wren-launcher-linux.tar.gz"
    sha256 "40fa03cf85118debf3d5c5db4558750bdce7ba62f340d907d566fd122e7982c0"
  end

  if OS.mac? && Hardware::CPU.is_64_bit?
    url "https://github.com/Canner/WrenAI/releases/download/0.23.0/wren-launcher-darwin.tar.gz"
    sha256 "539066cedc399fab46a2fd33161fc32efb948c11d682b4d14fc496af2ac87535"
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
