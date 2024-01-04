require("flutter-tools").setup()

require('flutter-tools').setup_project({
  {
    name = 'Development', -- an arbitrary name that you provide so you can recognise this config
    flavor = 'Alpha', -- your flavour
    target = 'lib/main-alpha.dart', -- your target
    dart_define = {
      IS_DEV = true,
    },
  },
})

