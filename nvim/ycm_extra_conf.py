# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
'-Wall',
'-stdlib=libc++',
'-std=c++14',
'-x', 'c++',
# '-isystem', '../BoostParts',
'-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/7.3.0/include',
'-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
'-isystem', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include',
'-isystem', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks',
'-isystem', '/System/Library/Frameworks/Python.framework/Headers',
'-isystem', '../llvm/include',
'-isystem', '../llvm/tools/clang/include',
# JUCE
'-I', '/Applications/JUCE/modules',
'-I', '/Applications/JUCE/modules/juce_audio_basics',
'-I', '/Applications/JUCE/modules/juce_audio_basics/buffers',
'-I', '/Applications/JUCE/modules/juce_audio_basics/effects',
'-I', '/Applications/JUCE/modules/juce_audio_basics/midi',
'-I', '/Applications/JUCE/modules/juce_audio_basics/mpe',
'-I', '/Applications/JUCE/modules/juce_audio_basics/sources',
'-I', '/Applications/JUCE/modules/juce_audio_basics/synthesisers',
'-I', '/Applications/JUCE/modules/juce_audio_devices',
'-I', '/Applications/JUCE/modules/juce_audio_devices/audio_io',
'-I', '/Applications/JUCE/modules/juce_audio_devices/midi_io',
'-I', '/Applications/JUCE/modules/juce_audio_devices/native',
'-I', '/Applications/JUCE/modules/juce_audio_devices/sources',
'-I', '/Applications/JUCE/modules/juce_audio_formats',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/flac',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/flac/libFLAC',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/flac/libFLAC/include',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/flac/libFLAC/include/private',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/flac/libFLAC/include/protected',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/oggvorbis',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/oggvorbis/libvorbis-1.3.2',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/oggvorbis/libvorbis-1.3.2/lib',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/oggvorbis/libvorbis-1.3.2/lib/books',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/oggvorbis/libvorbis-1.3.2/lib/books/coupled',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/oggvorbis/libvorbis-1.3.2/lib/books/floor',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/oggvorbis/libvorbis-1.3.2/lib/books/uncoupled',
'-I', '/Applications/JUCE/modules/juce_audio_formats/codecs/oggvorbis/libvorbis-1.3.2/lib/modes',
'-I', '/Applications/JUCE/modules/juce_audio_formats/format',
'-I', '/Applications/JUCE/modules/juce_audio_formats/sampler',
'-I', '/Applications/JUCE/modules/juce_audio_plugin_client',
'-I', '/Applications/JUCE/modules/juce_audio_plugin_client/AAX',
'-I', '/Applications/JUCE/modules/juce_audio_plugin_client/AU',
'-I', '/Applications/JUCE/modules/juce_audio_plugin_client/AU/CoreAudioUtilityClasses',
'-I', '/Applications/JUCE/modules/juce_audio_plugin_client/RTAS',
'-I', '/Applications/JUCE/modules/juce_audio_plugin_client/Standalone',
'-I', '/Applications/JUCE/modules/juce_audio_plugin_client/utility',
'-I', '/Applications/JUCE/modules/juce_audio_plugin_client/VST',
'-I', '/Applications/JUCE/modules/juce_audio_plugin_client/VST3',
'-I', '/Applications/JUCE/modules/juce_audio_processors',
'-I', '/Applications/JUCE/modules/juce_audio_processors/format',
'-I', '/Applications/JUCE/modules/juce_audio_processors/format_types',
'-I', '/Applications/JUCE/modules/juce_audio_processors/processors',
'-I', '/Applications/JUCE/modules/juce_audio_processors/scanning',
'-I', '/Applications/JUCE/modules/juce_audio_processors/utilities',
'-I', '/Applications/JUCE/modules/juce_audio_utils',
'-I', '/Applications/JUCE/modules/juce_audio_utils/audio_cd',
'-I', '/Applications/JUCE/modules/juce_audio_utils/gui',
'-I', '/Applications/JUCE/modules/juce_audio_utils/native',
'-I', '/Applications/JUCE/modules/juce_audio_utils/players',
'-I', '/Applications/JUCE/modules/juce_blocks_basics',
'-I', '/Applications/JUCE/modules/juce_blocks_basics/blocks',
'-I', '/Applications/JUCE/modules/juce_blocks_basics/littlefoot',
'-I', '/Applications/JUCE/modules/juce_blocks_basics/protocol',
'-I', '/Applications/JUCE/modules/juce_blocks_basics/topology',
'-I', '/Applications/JUCE/modules/juce_blocks_basics/visualisers',
'-I', '/Applications/JUCE/modules/juce_box2d',
'-I', '/Applications/JUCE/modules/juce_box2d/box2d',
'-I', '/Applications/JUCE/modules/juce_box2d/box2d/Collision',
'-I', '/Applications/JUCE/modules/juce_box2d/box2d/Collision/Shapes',
'-I', '/Applications/JUCE/modules/juce_box2d/box2d/Common',
'-I', '/Applications/JUCE/modules/juce_box2d/box2d/Dynamics',
'-I', '/Applications/JUCE/modules/juce_box2d/box2d/Dynamics/Contacts',
'-I', '/Applications/JUCE/modules/juce_box2d/box2d/Dynamics/Joints',
'-I', '/Applications/JUCE/modules/juce_box2d/box2d/Rope',
'-I', '/Applications/JUCE/modules/juce_box2d/utils',
'-I', '/Applications/JUCE/modules/juce_core',
'-I', '/Applications/JUCE/modules/juce_core/containers',
'-I', '/Applications/JUCE/modules/juce_core/files',
'-I', '/Applications/JUCE/modules/juce_core/javascript',
'-I', '/Applications/JUCE/modules/juce_core/logging',
'-I', '/Applications/JUCE/modules/juce_core/maths',
'-I', '/Applications/JUCE/modules/juce_core/memory',
'-I', '/Applications/JUCE/modules/juce_core/misc',
'-I', '/Applications/JUCE/modules/juce_core/native',
'-I', '/Applications/JUCE/modules/juce_core/native/java',
'-I', '/Applications/JUCE/modules/juce_core/network',
'-I', '/Applications/JUCE/modules/juce_core/streams',
'-I', '/Applications/JUCE/modules/juce_core/system',
'-I', '/Applications/JUCE/modules/juce_core/text',
'-I', '/Applications/JUCE/modules/juce_core/threads',
'-I', '/Applications/JUCE/modules/juce_core/time',
'-I', '/Applications/JUCE/modules/juce_core/unit_tests',
'-I', '/Applications/JUCE/modules/juce_core/xml',
'-I', '/Applications/JUCE/modules/juce_core/zip',
'-I', '/Applications/JUCE/modules/juce_core/zip/zlib',
'-I', '/Applications/JUCE/modules/juce_cryptography',
'-I', '/Applications/JUCE/modules/juce_cryptography/encryption',
'-I', '/Applications/JUCE/modules/juce_cryptography/hashing',
'-I', '/Applications/JUCE/modules/juce_data_structures',
'-I', '/Applications/JUCE/modules/juce_data_structures/app_properties',
'-I', '/Applications/JUCE/modules/juce_data_structures/undomanager',
'-I', '/Applications/JUCE/modules/juce_data_structures/values',
'-I', '/Applications/JUCE/modules/juce_events',
'-I', '/Applications/JUCE/modules/juce_events/broadcasters',
'-I', '/Applications/JUCE/modules/juce_events/interprocess',
'-I', '/Applications/JUCE/modules/juce_events/messages',
'-I', '/Applications/JUCE/modules/juce_events/native',
'-I', '/Applications/JUCE/modules/juce_events/timers',
'-I', '/Applications/JUCE/modules/juce_graphics',
'-I', '/Applications/JUCE/modules/juce_graphics/colour',
'-I', '/Applications/JUCE/modules/juce_graphics/contexts',
'-I', '/Applications/JUCE/modules/juce_graphics/effects',
'-I', '/Applications/JUCE/modules/juce_graphics/fonts',
'-I', '/Applications/JUCE/modules/juce_graphics/geometry',
'-I', '/Applications/JUCE/modules/juce_graphics/image_formats',
'-I', '/Applications/JUCE/modules/juce_graphics/image_formats/jpglib',
'-I', '/Applications/JUCE/modules/juce_graphics/image_formats/pnglib',
'-I', '/Applications/JUCE/modules/juce_graphics/images',
'-I', '/Applications/JUCE/modules/juce_graphics/native',
'-I', '/Applications/JUCE/modules/juce_graphics/placement',
'-I', '/Applications/JUCE/modules/juce_gui_basics',
'-I', '/Applications/JUCE/modules/juce_gui_basics/application',
'-I', '/Applications/JUCE/modules/juce_gui_basics/buttons',
'-I', '/Applications/JUCE/modules/juce_gui_basics/commands',
'-I', '/Applications/JUCE/modules/juce_gui_basics/components',
'-I', '/Applications/JUCE/modules/juce_gui_basics/drawables',
'-I', '/Applications/JUCE/modules/juce_gui_basics/filebrowser',
'-I', '/Applications/JUCE/modules/juce_gui_basics/keyboard',
'-I', '/Applications/JUCE/modules/juce_gui_basics/layout',
'-I', '/Applications/JUCE/modules/juce_gui_basics/lookandfeel',
'-I', '/Applications/JUCE/modules/juce_gui_basics/menus',
'-I', '/Applications/JUCE/modules/juce_gui_basics/misc',
'-I', '/Applications/JUCE/modules/juce_gui_basics/mouse',
'-I', '/Applications/JUCE/modules/juce_gui_basics/native',
'-I', '/Applications/JUCE/modules/juce_gui_basics/positioning',
'-I', '/Applications/JUCE/modules/juce_gui_basics/properties',
'-I', '/Applications/JUCE/modules/juce_gui_basics/widgets',
'-I', '/Applications/JUCE/modules/juce_gui_basics/windows',
'-I', '/Applications/JUCE/modules/juce_gui_extra',
'-I', '/Applications/JUCE/modules/juce_gui_extra/code_editor',
'-I', '/Applications/JUCE/modules/juce_gui_extra/documents',
'-I', '/Applications/JUCE/modules/juce_gui_extra/embedding',
'-I', '/Applications/JUCE/modules/juce_gui_extra/misc',
'-I', '/Applications/JUCE/modules/juce_gui_extra/native',
'-I', '/Applications/JUCE/modules/juce_opengl',
'-I', '/Applications/JUCE/modules/juce_opengl/geometry',
'-I', '/Applications/JUCE/modules/juce_opengl/native',
'-I', '/Applications/JUCE/modules/juce_opengl/opengl',
'-I', '/Applications/JUCE/modules/juce_opengl/utils',
'-I', '/Applications/JUCE/modules/juce_osc',
'-I', '/Applications/JUCE/modules/juce_osc/osc',
'-I', '/Applications/JUCE/modules/juce_tracktion_marketplace',
'-I', '/Applications/JUCE/modules/juce_tracktion_marketplace/marketplace',
'-I', '/Applications/JUCE/modules/juce_video',
'-I', '/Applications/JUCE/modules/juce_video/capture',
'-I', '/Applications/JUCE/modules/juce_video/native',
'-I', '/Applications/JUCE/modules/juce_video/playback',
# JUCE
'-I', '.',
'-I', './ClangCompleter',
'-I', '../JuceLibraryCode',
]


# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = GetCompilationInfoForFile( filename )
    if not compilation_info:
      return None

    final_flags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_ )

    # NOTE: This is just for YouCompleteMe; it's highly likely that your project
    # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
    # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
    try:
      final_flags.remove( '-stdlib=libc++' )
    except ValueError:
      pass
  else:
    relative_to = DirectoryOfThisScript()
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }

