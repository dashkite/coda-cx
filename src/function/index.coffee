import {Gadget, mixin, tag, bebop, shadow,
  render, properties, events, local,
  describe, resource, smart} from "@dashkite/carbon"

import Store from "@dashkite/hydrogen"
import Registry from "@dashkite/helium"

import template from "./template"

class extends Gadget

  mixin @, [

    tag "coda-function"

    bebop, shadow, describe #, navigate

    getter cms: -> Registry.get @description.store ? "cms"

    resource -> Store.get @cms, index: "path", key: @dom.dataset.path

    render smart template

    properties
      view:
        get: ->
          if @value?
            {parent, category} = @value
            if category == "method"
              type: await lookup "path", parent
  ]
