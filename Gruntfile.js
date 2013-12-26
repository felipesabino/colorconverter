'use strict';

module.exports = function (grunt) {
  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({

    // Metadata
    pkg: grunt.file.readJSON('package.json'),
    banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>\n' +
      '* Licensed <%= pkg.licenses[0].type %> */\n',

    // Tasks configuration
    karma: {
      unit: {
        configFile: 'karma.conf.js',
        runnerPort: 9999,
        singleRun: true,
        browsers: ['PhantomJS']
      }
    },
    coffee: {
      build: {
        options: {
          bare: true
        },
        files: [{
          expand: true,
          cwd: 'src',
          src: ['{,**/}*.coffee'],
          dest: '.tmp',
          ext: '.js'
        }]
      }
    },
    concat: {
      options: {
        banner: '<%= banner %>',
        stripBanners: true
      },
      build: {
        src: '.tmp/*.js',
        dest: 'color-converter.js'
      }
    },
    clean: {
      build: {
        src: '.tmp'
      }
    },
    uglify: {
      options: {
        banner: '<%= banner %>',
        stripBanners: true
      },
      build: {
        src: 'color-converter.js',
        dest: 'color-converter.min.js'
      }
    },
  });

  grunt.registerTask('test', ['karma']);
  grunt.registerTask('build', ['clean', 'coffee', 'concat', 'uglify']);

};
