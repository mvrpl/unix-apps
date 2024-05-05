class Chsht < Formula
    desc "Cheat Sheets on Terminal"
    homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
    license "MIT"
    version "0.3.0"

    livecheck do
        url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/latest.json"
        regex(/^v?(\d+(?:\.\d+)+)$/i)
        strategy :json do |json, regex|
            json["version"][regex, 1]
        end
    end

    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-linux-amd64"
        sha256 "2b34942a2620990b3585c4a1b3b37b75142336361814c67ce833e97bc8005cdf"
    end

    if OS.mac?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-arm64"
            sha256 "cdeb24002c70496796c742591403d706a926d3d9a33ae0cde397546c77840024"
        end

        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-amd64"
            sha256 "88f813f628131a9b347cd817c75208be436244cb4c319ba1edef3e7a337f3fdd"
        end
    end
    
    depends_on "less"
    
    def install
        if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            bin.install "chsht-linux-amd64" => "chsht"
        end

        if OS.mac?
            if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
                bin.install "chsht-macos-arm64" => "chsht"
            end

            if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
                bin.install "chsht-macos-amd64" => "chsht"
            end
        end
    end
end
