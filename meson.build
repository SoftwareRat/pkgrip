project('pkgrip', 'c',
  version : '0.1',
  default_options : [
    'warning_level=3',
    'werror=true',
    'c_std=c11',
  ])

cc = meson.get_compiler('c')

add_project_arguments(cc.get_supported_arguments([
  '-Wpedantic',
  '-Wshadow',
  '-Wstrict-aliasing',
  '-Wstrict-overflow',
  '-fno-strict-aliasing'
]), language: 'c')

zlib_dep = dependency('zlib', required : true)

inc = include_directories('libkirk')

libkirk_sources = [
  'libkirk/aes.c',
  'libkirk/amctrl.c',
  'libkirk/bn.c',
  'libkirk/ec.c',
  'libkirk/kirk_engine.c',
  'libkirk/sha1.c'
]

libkirk = static_library('kirk',
  libkirk_sources,
  include_directories : inc,
  c_args : ['-O2'])

pkgrip = executable('pkgrip',
  'pkgrip.c',
  include_directories : inc,
  link_with : libkirk,
  dependencies : [zlib_dep],
  install : true)

test('basic', pkgrip)
