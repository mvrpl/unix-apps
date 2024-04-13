class Chsht < Formula
    desc "Cheat Sheets on Terminal"
    homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
    license "MIT"
    version "0.2.5"

    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-linux-amd64"
        sha256 "d25a57f3f67da7ac2ee0f32dfd838a9647fac0604c8bc2d0e030a234437308c8"
    end

    if OS.mac?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-arm64"
            sha256 "e0796e49a6985e5cd9b3118db21a55035435ffd3717973bb9fd38e27696bc20a"
        end

        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-amd64"
            sha256 "f291732103501b43a8f05525937240fc4daaf6ab12933fd67f13e8711311b7ae"
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
