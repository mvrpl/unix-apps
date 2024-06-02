class Dataflow < Formula
  desc "ETL configurable written in Rust"
  homepage "https://bitbucket.org/mvrpl_br/dataflow"
  version "0.2.6"
  license "GPL-3.0"

  livecheck do
    url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/latest.json"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :json do |json, regex|
      json["version"][regex, 1]
    end
  end

  if OS.linux? 
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.6/dataflow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a13336580ba0dbb402204df5a630f59c132e8d4789c9ad859fff65eb7375d7f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.6/dataflow-aarch64-apple-darwin.tar.gz"
      sha256 "88e957d6b630d97917486ca22b18ed37a6e18eddf68f23b4b4c9c2a1f31125c8"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.6/dataflow-x86_64-apple-darwin.tar.gz"
      sha256 "b90422e3aa073f3a8bb8565b3a4523190ca117811a6966fc06561d3614bab35c"
    end
  end

  def install
    bin.install "dataflow"
  end
end
