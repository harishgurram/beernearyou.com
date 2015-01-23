function Nearby($target, options) {
  var defaults = {
    metric: false,
    timeout: 10000,
    frequency: 5000
  };

  this.$target = $target;
  this.$lat = $target.find("[name=lat]");
  this.$lng = $target.find("[name=lng]");
  this.$submit = $target.find("button[type=submit]");

  this.options = $.extend({}, defaults, options);
}

Nearby.prototype.init = function() {
  this.$target.one("submit", this._onSubmit.bind(this));
  return this;
};

Nearby.prototype._onSubmit = function(e) {
  e.preventDefault();

  this.$submit.text("Requesting location…").prop("disabled", true);

  var positionOptions = {
    enableHighAccuracy: true,
    timeout: this.options.timeout
  };

  window.navigator.geolocation.watchPosition(
    this._onPosition.bind(this),
    this._onError.bind(this),
    positionOptions
  );
};

Nearby.prototype._onPosition = function(pos) {
  this.$lat.val(pos.coords.latitude.toFixed(6));
  this.$lng.val(pos.coords.longitude.toFixed(6));
  this.$target.submit();
};

Nearby.prototype._onError = function(error) {
  window.console && window.console.log(error);
};
