class Spark3 < Formula
  desc "A unified analytics engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  version "3.5.9"
  license "Apache-2.0"

  url "https://dlcdn.apache.org/spark/spark-3.5.9/spark-3.5.9-bin-hadoop3.tgz"
  sha256 "31620af875b4b7fbc58422930ada27940c1417fdee3707a029680643b943150f"

  livecheck do
    url 'https://api.github.com/repos/apache/spark/tags?per_page=100'
    regex(/^v(3\.[\d\.]+)$/i)
    strategy :json do |json, regex|
      json.map do |release|
        match = release["name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on "openjdk@17"
  depends_on "python@3.12"

  def install
    rm(Dir["bin/*.cmd"])
    libexec.install Dir["*"]

    renamed_bins = {
      "spark-shell"  => "spark3-shell",
      "spark-submit" => "spark3-submit",
      "spark-sql" => "spark3-sql"
    }

    (bin/"pyspark3").write <<~EOS
      #!/bin/bash
      export PYSPARK_DRIVER_PYTHON="#{Formula["python@3.12"].prefix}/bin/python3.12"
      export PYSPARK_PYTHON="#{Formula["python@3.12"].prefix}/bin/python3.12"
      export JAVA_HOME="#{Formula["openjdk@17"].prefix}"
      #{prefix}/libexec/bin/pyspark "$@"
    EOS

    renamed_bins.each do |original, renamed|
      (bin/renamed).write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Formula["openjdk@17"].prefix}"
        #{prefix}/libexec/bin/#{original} "$@"
      EOS
    end
  end
end
