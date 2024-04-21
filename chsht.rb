class Chsht < Formula
    desc "Cheat Sheets on Terminal"
    homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
    license "MIT"
    version "0.2.5"

    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-linux-amd64"
        sha256 "4b82eec170661196732cf3013bbf57ec67e2e3d154ff8dedf4e082d4863a42a4"
    end

    if OS.mac?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-arm64"
        end

        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-amd64"
        end

        sha256 "5602db265d58da4f012f89ee6ca6a6d4b4fd4767c717e9ec78226a8e13ceac2c"
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
