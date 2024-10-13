class Dataflow < Formula
  desc "ETL configurable written in Python"
  homepage "https://bitbucket.org/mvrpl_br/dataflow"
  version "0.3.0"
  license "GPL-3.0"

  url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.3.0/dataflow-0.3.0.tar.gz"
  sha256 "b691cf2f5dd179131a80bbab840bde268d075b441c2f7ac89949e5e61a0dc7f3"

  depends_on "python@3.11"

  livecheck do
    url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/latest.json"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :json do |json, regex|
      json["version"][regex, 1]
    end
  end

  def install
    system "#{Formula["python@3.11"].opt_bin}/python3.11", "-m", "pip", "install", "-e", "#{prefix}"
    (bin/"dataflow").write <<~EOS
      #!/bin/bash
      set -e
      #{Formula["python@3.11"].opt_bin}/python3.11 -m dataflow $@
    EOS
  end
end
