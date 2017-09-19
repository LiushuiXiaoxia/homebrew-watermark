class Watermark < Formula
  desc "add water mark to image"
  homepage "https://github.com/LiushuiXiaoxia/WaterMark"
  url "https://github.com/LiushuiXiaoxia/WaterMark/blob/master/deploy/watermark-0.1.tar"
  sha256 "44726143af70bfeae4dc52d3c3a0716ccc8c9cf15f62ebf9b8c0f3e0c1c7ec4b"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/watermark.sh" => "watermark"

    cmd = "echo '#!/usr/bin/env sh' > #{libexec}/watermark.sh"
    system cmd
    
    text = "python #{libexec}/watermark.py $@"
    cmd = "echo '#{text}' >> #{libexec}/watermark.sh"
    system cmd
  end

  test do
    File.exist? "#{bin}/watermark"
  end
end