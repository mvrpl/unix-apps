class Spark3 < Formula
  desc "A unified analytics engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  version "3.5.8"
  license "Apache-2.0"

  url "https://dlcdn.apache.org/spark/spark-3.5.8/spark-3.5.8-bin-hadoop3.tgz"
  sha256 "24c24fec87ab3e1187bba320844f283ceff6036efd8108d3ae17d6911e3f6895"

  livecheck do
    skip "Reason for skipping (e.g., custom versioning, no updates)"
  end

  depends_on "openjdk@17"

  def install
    rm_f Dir["bin/*.cmd"]

    renamed_bins = {
      "spark-shell"  => "spark3-shell",
      "spark-submit" => "spark3-submit",
      "pyspark" => "pyspark3",
      "spark-sql" => "spark3-sql",
    }

    renamed_bins.each do |original, renamed|
      bin.install bin/original => bin/renamed
    end
  end
end
