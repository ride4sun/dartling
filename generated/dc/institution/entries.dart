
InstitutionEntries fromJsonToInstitutionEntries(Domain domain,
                                                [String modelCode = 'default']) {
  /**
   *  || Ecole
   *  id numero
   *  rq nom
   *  at adress
   */
  var json = '''
    {"width":990,"lines":[],"height":580,
     "boxes":[
      {"entry":true,"name":"Ecole", "x":342,"y":252,"width":120,"height":120,
       "items":[
        {"sequence":10,"category":"identifier","name":"numero",
         "type":"int","init":""
        },
        {"sequence":20,"category":"required","name":"nom",
         "type":"String","init":""
        },
        {"sequence":30,"category":"attribute","name":"adress",
         "type":"String","init":""
        }]
      }]
    }
  ''';
  return new InstitutionEntries(fromMagicBoxes(json, domain, modelCode));
}

class InstitutionEntries extends ModelEntries {

  InstitutionEntries(Model model) : super(model);

  Map<String, Entities> newEntries() {
    var entries = new Map<String, Entities>();
    var concept = model.concepts.findByCode('Ecole');
    entries[concept.code] = new Ecoles(concept);
    return entries;
  }

  Ecoles get ecoles() => getEntry('Ecole');

  Concept get ecoleConcept() => ecoles.concept;

}