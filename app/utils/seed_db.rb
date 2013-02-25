class SeedDb
  class << self
    def seed
      user = User.create(name: 'rlpowell', email: 'rlpowell@lojban.org')
      lang = Language.create(code: 'en')
      pu_tag = Tag.create(text: 'pu')
      nu_tag = Tag.create(text: 'nu')

      def places(n)
        (0..n - 1).each_with_object([]) {|pos, arr| arr << {position: pos}}
      end

      # djica
      djica_places = Place.create(places(3))
      djica_places[1].update_attributes(kind: 'event/state')

      djica_rafsi = Rafsi.create([{text: 'dji'}])
      djica = Word.create({
          text: 'djica',
          valsi_type: 'gismu',
          user: user,
          places: djica_places,
          rafsi: djica_rafsi
        })

      # gloss
      djica.glosses << Gloss.create(text: 'desire', language: lang)
      djica.glosses << Gloss.create(text: 'desired', language: lang, tag: pu_tag)
      djica.save!

      # place glosses
      djica.places[0].glosses << Gloss.create(text: 'desirer', language: lang)
      djica.places[1].glosses << Gloss.create(text: 'desired', language: lang)

      # definition
      djica_definition = Definition.create({
          text: "{1} desires/wants/wishes {2} for purpose {3}",
          user: user,
          language: lang,
          word: djica
        })


      # cusku
      cusku_places = Place.create(places(4))
      cusku_places[0].update_attributes(kind: 'agent')
      cusku_places[1].update_attributes(kind: "sedu'u/text/lu'e")

      cusku_rafsi = Rafsi.create([{text: 'cus'}, {text: 'sku'}])
      cusku = Word.create({
        text: 'cusku',
        valsi_type: 'gismu',
        user: user,
        places: cusku_places,
        rafsi: cusku_rafsi
      })

      # gloss
      cusku.glosses << Gloss.create(text: 'express', language: lang)
      cusku.glosses << Gloss.create(text: 'expressed', language: lang, tag: pu_tag)
      cusku.glosses << Gloss.create(text: 'expressing', language: lang, tag: nu_tag)
      cusku.save!

      # place glosses
      cusku.places[0].glosses << Gloss.create(text: 'expresser', language: lang)
      cusku.places[1].glosses << Gloss.create(text: 'expression', language: lang)
      cusku.places[2].glosses << Gloss.create(text: 'audience', language: lang)
      cusku.places[3].glosses << Gloss.create(text: 'expressive medium', language: lang)

      # definition
      cusku_definition = Definition.create({
        text: "{1} expresses/says {2} for audience {3} via expressive medium {4}",
        user: user,
        language: lang,
        word: cusku
      })


      # djisku
      djisku_places = Place.create(places(5))
      djisku_places[0].update_attributes(kind: 'agent', source_places: [djica_places[0], cusku_places[0]])
      djisku_places[1].update_attributes(kind: "sedu'u/text/lu'e", source_places: [cusku_places[1]])
      djisku_places[2].update_attributes(source_places: [cusku_places[2]])
      djisku_places[3].update_attributes(source_places: [cusku_places[3]])
      djisku_places[4].update_attributes(source_places: [djica_places[2]])

      djisku = Word.create({
        text: 'djisku',
        valsi_type: 'gismu',
        user: user,
        places: djisku_places
      })

      # gloss
      # doesn't have any?

      # place glosses
      djisku.places[0].glosses << Gloss.create(text: 'expresser', language: lang)
      djisku.places[1].glosses << Gloss.create(text: 'expression', language: lang)
      djisku.places[2].glosses << Gloss.create(text: 'audience', language: lang)
      djisku.places[3].glosses << Gloss.create(text: 'expressive medium', language: lang)

      # definition
      djisku_definition = Definition.create({
        text: "{1} wants to say/express {2} for audience {3} via expressive medium {4}, and this is desired for purpose {5}",
        user: user,
        language: lang,
        word: djisku
      })
    end
  end
end