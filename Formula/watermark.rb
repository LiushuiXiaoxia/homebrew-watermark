class Watermark < Formula
  desc "add water mark to image"
  homepage "https://github.com/LiushuiXiaoxia/WaterMark"
  url "https://github.com/LiushuiXiaoxia/WaterMark/blob/master/deploy/watermark-0.1.tar"
  sha256 "bf7c6c50d159501d07788fb02b08f7cea88e6ff9e5e411340a82357b28394537"

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