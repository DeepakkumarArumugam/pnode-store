var eg = require('../eg');

var store = eg.create();
var foo = store.bucket('foo');

eg.after(1000, function() {
  foo.set('s1-bar', eg.val(50)+7);
});
