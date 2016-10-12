{EventEmitter} = require 'events'

class Tracker extends EventEmitter
  findDevice : () ->
    this.emit 'add'

module.exports = Tracker