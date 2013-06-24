module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    concat: {
      options: {
           banner: '/*! <%= pkg.name %> \n by @spencermountain\n <%= grunt.template.today("yyyy-mm-dd") %> */\n',
         },
      dist: {
        src: ['./*/index.js'],
        dest: './index.js'
      }
    },
    uglify:{
      do:{
       src: ['./index.js'],
       dest: './index.min.js'
     }
    }

  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-concat');

  grunt.registerTask('default', ['concat','uglify']);

};