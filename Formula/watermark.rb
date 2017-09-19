class Watermark < Formula
  desc "add water mark to image"
  homepage "https://github.com/LiushuiXiaoxia/WaterMark"
  url "https://github.com/LiushuiXiaoxia/WaterMark/blob/master/deploy/watermark-0.1.tar"
  sha256 "60fe423dd0464ef3017b2d7fa1f17226a3d3ad131b81f2978b9c49e1a694d640"

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