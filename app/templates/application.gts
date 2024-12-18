import RouteTemplate from 'ember-route-template';
import { tracked } from '@glimmer/tracking';
import Component from '@glimmer/component';
import PowerSelectMultiple from 'ember-power-select/components/power-select-multiple';
import type { MatcherFn } from 'ember-power-select/utils/group-utils';
import or from 'ember-truth-helpers/helpers/or';
import 'ember-power-select/styles';

type Option = {
  name: string | null;
  serialNumber: string;
  manufacturer: string;
  model: string;
};

const options: Option[] = [
  {
    name: 'Excavator 24',
    serialNumber: '320D01',
    manufacturer: 'Caterpillar',
    model: '320D',
  },
  {
    name: null,
    serialNumber: '320D02',
    manufacturer: 'Caterpillar',
    model: '320D',
  },
];

const matcher: MatcherFn = (option: Option, term: string) => {
  return JSON.stringify(option).toLowerCase().indexOf(term.toLowerCase());
};

class MyRouteComponent extends Component {
  @tracked selected?: Option;

  get message() {
    return String(this.args.model).toUpperCase();
  }

  onChange = (selected: Option[]) => {
    this.selected = selected;
  };

  <template>
    1) select '320D02':

    <PowerSelectMultiple
      @options={{options}}
      @selected={{this.selected}}
      @onChange={{this.onChange}}
      @searchEnabled={{true}}
      @renderInPlace={{true}}
      @placeholder='Select an excavator'
      @matcher={{matcher}}
      @searchField='name'
      as |option|
    >
      {{or option.name option.serialNumber}}

      <span style='opacity: 0.5'>
        ({{option.manufacturer}}
        {{option.model}})
      </span>

    </PowerSelectMultiple>

    <div style='margin-top: 4rem'>
      2) Press backspace to remove '101'. See type error:

      <pre style='font-family: monospace'>
        TypeError: Cannot read properties of null (reading 'length') of null
      </pre>
    </div>
  </template>
}

export default RouteTemplate(MyRouteComponent);
