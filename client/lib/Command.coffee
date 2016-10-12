class Command
  constructor : (@cmd,@args...) ->
  execute : (callback) ->
    throw new Exception 'Miss implementation'

module.exports = Command