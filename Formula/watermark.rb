class Watermark < Formula
  desc "add water mark to image"
  homepage "https://github.com/LiushuiXiaoxia/WaterMark"
  url "https://github.com/LiushuiXiaoxia/WaterMark/blob/master/deploy/watermark-0.1.tar"
  sha256 "1c890a6500c9dd55a3b133ba08bc732e2a02b446cc2cfe73fa63ce5bd0f5442d"

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