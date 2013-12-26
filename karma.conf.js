// karma.conf.js
module.exports = function(config) {
  config.set({
    preprocessors: {
      '**/*.coffee': ['coffee']
    },

    coffeePreprocessor: {
      // options passed to the coffee compiler
      options: {
        bare: true,
        sourceMap: false
      },
      // transforming the filenames
      transformPath: function(path) {
        return path.replace(/\.js$/, '.coffee');
      }
    },

    frameworks: ['jasmine'],

    files: [
      '{src,tests}/{**,/}*.coffee'
    ]
  });
};
