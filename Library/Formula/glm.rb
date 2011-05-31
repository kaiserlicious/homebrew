require 'formula'

class Glm < Formula
  url 'http://downloads.sourceforge.net/project/ogl-math/glm-0.9.2.1/glm-0.9.2.1.zip'
  homepage 'http://glm.g-truc.net'
  md5 '3ce54fbaac0360ef75f40c2a6bbecb82'

  depends_on 'cmake'

  def options
    [
      ['--with-tests', "build and install tests"]
    ]
  end

  def install
    if ARGV.include? '--with-tests'
      system "cmake . #{std_cmake_parameters} -DGLM_TEST_MODE=ON"
      system "make install"
    else
      include.install Dir['glm']
    end
  end
end
