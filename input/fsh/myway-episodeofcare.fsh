Alias: $encounter-extension = http://hl7.org.nz/fhir/StructureDefinition/enrolment-encounter

Profile: MyWaiRegistration
Parent: EpisodeOfCare
Description: "FHIR profile for the EpisodeOfCare resource, used to return the MyWai registration status of a person, and a set of key attributes related to the patient's care details in the MyWai System.

The API would support one or two of the standard FHIR REST API interactions [defined here](https://hl7.org/fhir/R4B/http.html). The relevant ones for this use case are likely to be Read and/or Search by Identifier (an NHI).

To return the status for a patient with NHI ZZZ0008, you would query the API with:

```
GET [baseServiceUrl]/EpisodeOfCare?patient.identifier=https://standards.digital.health.nz/ns/nhi-id|ZZZ0008
```

You could, once you had found the right resource, make subsequent queries using the id, e.g.:

```
GET [baseServiceUrl]/EpisodeOfCare/[id]
```

Note that the id is likely to be an opaque server generated string (e.g. GUID) rather than something like the NHI. FHIR makes a distinction between id's such as guids that a server generates and business numbers/identifiers (which it calls 'Identifiers').
"

* diagnosis 0..0
* referralRequest 0..0
* team 0..0
* account 0..0
* type 0..0
* managingOrganization 0..0
* careManager 0..0
* patient ^short = "The patient whose MyWai status this resource describes"
* extension contains $encounter-extension named lastEncounters 0..*


Extension: Enrolment_encounter
Id: enrolment-encounter
Description: "The last qualified encounter foe this enrolment"
* ^url = $encounter-extension
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* ^status = #draft
* extension 0..0
* value[x] only Reference(Encounter)

/*
Instance: MyWaiRegistrationExample
InstanceOf: MyWaiRegistration
Description: "An example instance of a MyWaiRegistration EpisodeOfCare resource. This is what the API would return."
* name
  * given[0] = "James"
  * family = "Pond"

  */