module.exports = (grunt) ->
  require("matchdep").filterDev("grunt-*").forEach(grunt.loadNpmTasks);

  tmpdir = grunt.option('tmpdir') || os.tmpdir()
  screens = grunt.option('screens') || [
    { src: "http://google.com", dest: "home.jpg"}
  ];

  # sitemap = grunt.option('sitemap')
  # buffer = grunt.option('buffer') || Number.MAX_VALUE
  # if sitemap
    # sitemap = parseXML grunt.file.read grunt.option('sitemap')
    # urls = _.pluck(sitemap.childs, "childs")
    # screens = []
    # process.setMaxListeners(0);
    # _.each urls, (element, index, list) ->
    #   if index < buffer
    #     url = _.first element
    #     url = url.childs[0]
    #     screens.push({src: url, dest: "wervik/wervik-#{url.substr(24)}.png", delay: 0})


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
          viewport: ["768x1024"]

      phone:
        options:
          path: tmpdir
          remote:
            files: screens
          viewport: ["320x1024"]

  # DEFAULT TASK.
  grunt.registerTask "default", ["autoshot"]
