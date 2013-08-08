# store data in a JSON file


    # @tmpDir = path.join process.cwd(), 'tmp'
    # @dataFile = path.join @tmpDir, 'data.json'

    # @_persist = _.debounce @_persist, options.persistDelay or 5000

# bucket =
#   _persist: ->
#     json = JSON.stringify @data
#     return if json is @_persisted
#     fs.writeFile @dataFile, json, (err) =>
#       if err
#         @log "error persisting data store: #{err}"
#       else
#         @log "data store persisted"
#         @_persisted = json

#   _restore: ->
#     mkdirp.sync @tmpDir
#     return null unless fs.existsSync @dataFile
#     json = fs.readFileSync @dataFile
#     return unless json
#     try
#       data = JSON.parse json
#       @log "data store restored"
#       @_persisted = json
#       return data
#     catch e

#     return null


class FileBackend

  async: false

  constructor: (options) ->
    #TODO
    # options for file location
    # load sync on start
    # write sync on process.exit (and during idle time?)
    @data = {}
  
  get: (key) ->
    return @data[key]
  
  set: (key, val) ->
    return @data[key] = val
  
  del: (key) ->
    delete @data[key]
    return true
  
  getAll: ->
    #copy data
    obj = {}
    for k,v of @data
      obj[k] = v
    return obj

exports.create = (options) ->
  return new FileBackend options
