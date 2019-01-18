/**
 * Session service.
 *
 * @returns {{create: create, setUsername: setUsername, getAuthToken: getAuthToken, isActive: isActive, setData: setData, getData: getData, destroy: destroy, set: set, get: get, remove: remove}}
 * @constructor
 */
function Session() {
  var usernameKey = "username";
  var cookieSessionDataKey = "SessionData";

  return {
    create: create,
    setUsername: setUsername,
    getUsername: getUsername,
    isActive: isActive,
    setData: setData,
    getData: getData,
    destroy: destroy,
    destroyData:destroyData,
    set: set,
    get: get,
    remove: remove
  };

  //////////////////////////////

  /**
   * Create session.
   *
   * @param username
   * @param data
   */
  function create(username, data) {
    setAuthToken(username);
    setData(data);
  }

  /**
   * Set the auth token.
   *
   * @param username
   */
  function setUsername(username) {
    Cookies.set(usernameKey, username);
  }

  /**
   * Get the auth token.
   */
  function getUsername() {
    return Cookies.get(usernameKey);
  }


  /**
   * Check if the session is active.
   */
  function isActive() {
    return !!getAuthToken();
  }

  /**
   * Set the session data.
   *
   * @param data
   */
  function setData(data) {
    Cookies.set(cookieSessionDataKey, angular.toJson(data));
  }

  /**
   * Return the session data.
   */
  function getData() {
    return angular.fromJson(Cookies.get(cookieSessionDataKey));
  }

  /**
   * Destroy session.
   */
  function destroy() {
    Cookies.expire(usernameKey);
    Cookies.expire(cookieSessionDataKey);
  }

  function destroyData(){
      Cookies.expire(cookieSessionDataKey);
  }

  /**
   * Set a value in session data.
   *
   * @param key
   * @param value
   * @returns {*}
   */
  function set(key, value) {
    var sessionData = getData() || {};
    _.set(sessionData, key, value);
    setData(sessionData);
    return this;
  }

  /**
   * Get a value from session data.
   *
   * @param key
   * @param defaultValue
   * @returns {*}
   */
  function get(key, defaultValue) {
    var sessionData = getData() || {};
    return _.get(sessionData, key, defaultValue);
  }

  /**
   * Remove the given key from session data.
   *
   * @param key
   * @returns {*}
   */
  function remove(key) {
    var sessionData = getData() || {};
    delete sessionData[key];
    setData(sessionData);
    return this;
  }
}

angular
  .module("app")
  .service("Session", Session);
