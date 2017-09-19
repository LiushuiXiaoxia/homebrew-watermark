class Watermark < Formula
  desc "add water mark to image"
  homepage "https://github.com/LiushuiXiaoxia/WaterMark"
  url "https://github.com/LiushuiXiaoxia/WaterMark/blob/master/deploy/watermark-0.1.tar"
  sha256 "8d5031d79687a7608400488ef409468be3704def4ff251eb94a1223937ab95de"

  def install
    libexec.install Dir["*"]

    cmd = "echo '#!/usr/bin/env sh' > #{libexec}/watermark.sh"
    system cmd
    
    text = "python #{libexec}/watermark.py $@"
    cmd = "echo '#{text}' >> #{libexec}/watermark.sh"
    system cmd

    cmd = 'chmod'
    bin.install_symlink "#{libexec}/watermark.sh" => "watermark"
  end

  test do
    File.exist? "#{bin}/watermark"
  end
end