import {Gadget, mixin, tag, bebop, shadow,
  render, properties, events, local,
  describe, resource, smart} from "@dashkite/carbon"

import Store from "@dashkite/hydrogen"
import Registry from "@dashkite/helium"

import template from "./template"

class extends Gadget

  mixin @, [

    tag "coda-properties"

    bebop, shadow, describe #, navigate

    getter cms: -> Registry.get @description.store ? "cms"

    resource -> Store.glob @cms, @dom.dataset.glob

    render smart template

  ]