require 'formula'

class Bullet <Formula
  url 'http://bullet.googlecode.com/files/bullet-2.76.tgz'
  homepage 'http://bulletphysics.org'
  md5 '88ddd066480ba4fd1e17fcb4a505fac3'

 depends_on 'cmake'

  def install
#    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "cmake . -DINSTALL-LIBS=1 "+"#{std_cmake_parameters}"
    system "make"
    system "make install"
  end
end
