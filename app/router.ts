import EmberRouter from '@ember/routing/router';
import config from 'ember-power-select-reproduction-of-issue-1854/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  // Add route declarations here
});
