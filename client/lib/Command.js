// Generated by CoffeeScript 1.11.1
(function() {
  var Command,
    slice = [].slice;

  Command = (function() {
    function Command() {
      var args, cmd;
      cmd = arguments[0], args = 2 <= arguments.length ? slice.call(arguments, 1) : [];
      this.cmd = cmd;
      this.args = args;
    }

    Command.prototype.execute = function(callback) {
      throw new Exception('Miss implementation');
    };

    return Command;

  })();

  module.exports = Command;

}).call(this);

//# sourceMappingURL=Command.js.map