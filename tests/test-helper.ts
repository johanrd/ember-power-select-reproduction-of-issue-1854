import Application from 'ember-power-select-reproduction-of-issue-1854/app';
import config from 'ember-power-select-reproduction-of-issue-1854/config/environment';
import * as QUnit from 'qunit';
import { setApplication } from '@ember/test-helpers';
import { setup } from 'qunit-dom';
import { start } from 'ember-qunit';

setApplication(Application.create(config.APP));

setup(QUnit.assert);

start();
