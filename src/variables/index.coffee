import {Gadget, mixin, tag, bebop, shadow,
  render, properties, getter, events, local,
  describe, resource, smart} from "@dashkite/carbon"
import {dashed} from "panda-parchment"

import Store from "@dashkite/hydrogen"
import Registry from "@dashkite/helium"


import template from "./template"

class extends Gadget

  mixin @, [

    tag "coda-variables"

    bebop, shadow, describe #, navigate

    getter cms: -> Registry.get @description.store ? "cms"

    resource -> Store.get @cms, index: "path", key: @description.path

    properties
      view: get: ->
        if @value?
          {parent, category, scope, variables, data} = @value
          if category == "method" && scope == "instance"
            type = await lookup "path", parent
            variables: [
                name: dashed type.name
                type: "[`#{type.name}`][]"
                description: "An instance of [`#{type.name}`][]."
              ,
                variables...
              ]
          else
            # site properties are just a Block content type
            # so we need to pull variables from data ...
            variables: variables ? data.variables

    render smart template

  ]
