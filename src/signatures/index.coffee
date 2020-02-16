import {Gadget, mixin, tag, bebop, shadow,
  render, properties, getter, events, local,
  describe, resource, smart} from "@dashkite/carbon"
import {dashed} from "panda-parchment"
import Store from "@dashkite/hydrogen"
import Registry from "@dashkite/helium"

import template from "./template"

class extends Gadget

  mixin @, [

    tag "coda-signatures"

    bebop, shadow, describe #, navigate

    getter cms: -> Registry.get @description.store ? "cms"

    resource -> Store.get @cms, index: "path", key: @description.path

    render smart template

    properties
      view:
        get: ->
          if @value?
            {parent, category, scope, name} = @value
            if category == "method"
              type = await Store.get @cms, index: "path", key: parent
              scoped:
                switch scope
                  when "class" then type.name
                  when "instance" then dashed type.name


  ]
