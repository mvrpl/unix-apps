class Dataflow < Formula
  desc "ETL configurable written in Python"
  homepage "https://bitbucket.org/mvrpl_br/dataflow"
  version "0.3.0"
  license "GPL-3.0"

  depends_on "python@3.11"

  def install
    system "#{Formula["python@3.11"].opt_bin}", "-m", "pip", "install", "dataflow"
    (bin/"dataflow").write <<~EOS
      #!/bin/sh
      set -e
      exec "#{Formula["python@3.11"].opt_bin}" -m dataflow "$@"
    EOS
  end
end
