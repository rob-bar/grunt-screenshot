module.exports = (grunt) ->
  require("matchdep").filterDev("grunt-*").forEach(grunt.loadNpmTasks);
  screens = grunt.option('screens') || [
    { src: "http://google.com", dest: "home.jpg"}
  ];

  # buffer = grunt.option('buffer') || Number.MAX_VALUE
  tmpdir = grunt.option('tmpdir') || os.tmpdir()
  # --buffer=2 --tmpdir="/Users/robbiebardijn/Documents/TEMP/screens_nngroup/"

  # PROJECT CONFIGURATION.
  grunt.initConfig
    autoshot:
      desktop:
        options:
          path: tmpdir
          remote:
            files: screens
          viewport: ["320x1024"]

      tablet:
        options:
          path: tmpdir
          remote:
            files: screens
          viewport: ["768x2500"]

      phone:
        options:
          path: tmpdir
          remote:
            files: screens
          viewport: ["320x2500"]

  # DEFAULT TASK.
  grunt.registerTask "default", ["autoshot"]
