require 'formula'

class Ogre3d <Formula
  url 'https://sourceforge.net/projects/ogre/files/ogre/1.7/ogre-v1-7-0p1.tar.bz2/download'
  homepage 'ogre3d.org'
  md5 'ac06fcb8f550019f4f12e5ca27699063'
  version '1.7.0'

 depends_on 'cmake'

  def patches
    {:p0 => DATA}
  end

  def install
#   system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end

__END__
--- CMakeLists.txt	2010-02-28 13:34:09.000000000 +0100
+++ CMakeLists.txt	2010-03-22 13:28:37.000000000 +0100
@@ -26,6 +26,11 @@
   set(CMAKE_SUPPRESS_REGENERATION true)
 endif()
 
+# Force gcc <= 4.0 on Mac OS X because 4.2 is not supported prior to Mac OS X 10.5
+include(CMakeForceCompiler)
+CMAKE_FORCE_C_COMPILER(gcc-4.0 GNU)
+CMAKE_FORCE_CXX_COMPILER(gcc-4.0 GNU)
+
 project(OGRE)
 
 # Include necessary submodules
@@ -182,9 +187,9 @@
   remove_definitions(-msse)
 elseif (APPLE AND NOT OGRE_BUILD_PLATFORM_IPHONE)
   # Force gcc <= 4.0 on Mac OS X because 4.2 is not supported prior to Mac OS X 10.5
-  include(CMakeForceCompiler)
-  CMAKE_FORCE_C_COMPILER(gcc-4.0 GNU)
-  CMAKE_FORCE_CXX_COMPILER(gcc-4.0 GNU)
+  #include(CMakeForceCompiler)
+  #CMAKE_FORCE_C_COMPILER(gcc-4.0 GNU)
+  #CMAKE_FORCE_CXX_COMPILER(gcc-4.0 GNU)
 
   # Set 10.4 as the base SDK by default
   set(XCODE_ATTRIBUTE_SDKROOT macosx10.4)

