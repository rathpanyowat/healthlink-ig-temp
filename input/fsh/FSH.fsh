Alias: $dopaURL = http://dopa.go.th
Alias: $hcodeURL = http://203.157.10.8/hcode_2020/query_set.php
Alias: $tmtURL = http://www.this.or.th/tmt_download.php
Alias: $tmttpuURL = https://healthlink.go.th/tmt/tpu
Alias: $tmtgpuURL = https://healthlink.go.th/tmt/gpu
Alias: $icd10tmURL = http://thcc.or.th/ICD-10TM/
Alias: $icd9URL = https://www.cdc.gov/nchs/icd/icd9.htm
Alias: $medicationQuantityURL = https://apis.healthlink.go.th/api/v1/fhir/StructureDefinition/MedicationQuantity
// Alias: $testCodeSystemURL = https://www.healthlink.go.th/fhir/CodeSystem/TestCodeSystem
// Alias: $testCodeSystemURL2 = https://www.healthlink.go.th/fhir/CodeSystem/TestCodeSystem2
// Alias: $testValueSetURL = https://www.healthlink.go.th/fhir/ValueSet/TestValueSet

Profile: HealthLinkPatient
Parent: Patient
Title: "Health Link Patient Profile"
* ^status = #draft
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    cid 1..1
* identifier[cid].system = $dopaURL
* identifier[cid].use = #official
* identifier[cid].value 1..
* active = true
* name 1..
* name.family 1..
* name.given 1..
* gender 1..
* birthDate 1..

Profile: HealthLinkOrganization
Parent: Organization
Title: "Health Link Organization Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..

Profile: HealthLinkAllergyIntolerance
Parent: AllergyIntolerance
Title: "Health Link AllergyIntolerance Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..
* clinicalStatus 1..
* verificationStatus 1..
* type 1..
* category 1..
* criticality 1..
* code 1..
* code from $tmtURL (preferred)
* patient 1..
* patient.reference 1..
* recordedDate 1..
* reaction 1..
* reaction.manifestation 1..
* reaction.severity 1..

Profile: HealthLinkImmunization
Parent: Immunization
Title: "Health Link Immunization Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..
* status 1..
* vaccineCode 1..
* vaccineCode from $tmttpuURL (preferred)
* patient 1..
* patient.reference 1..
* occurrenceDateTime 1..
* performer 1..
* performer.actor 1..

Extension: HealthLinkMedicationQuantity
Title:  "Health Link Medication Quantity"
Description: "Quantity of the medication ordered in the MedicationStatement"
* ^url = $medicationQuantityURL
* value[x] 1..
* value[x] only string or Quantity
* valueString 0..1
* valueQuantity 0..1
* valueQuantity.value 1..
* valueQuantity.unit 1..

Profile: HealthLinkMedicationStatement
Parent: MedicationStatement
Title: "Health Link MedicationStatement Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..
* extension contains
    $medicationQuantityURL named medicationQuantity 1..1
* status 1..
* medicationCodeableConcept 1..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* medicationCodeableConcept from $tmttpuURL (preferred)
* subject 1..
* subject only Reference(Patient)
* effectiveDateTime 1..
* informationSource 1..
* informationSource only Reference(Organization)

Profile: HealthLinkCondition
Parent: Condition
Title: "Health Link Condition Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..
* clinicalStatus 1..
* verificationStatus 1..
* category 1..
* code 1..
* code from $icd10tmURL (preferred)
* subject 1..
* subject only Reference(Patient)
* recordedDate 1..

Profile: HealthLinkProcedure
Parent: Procedure
Title: "Health Link Procedure Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..
* status 1..
* code 1..
* code from $icd9URL (preferred)
* subject 1..
* subject only Reference(Patient)
* performedDateTime 1..
* performer 1..
* performer.actor 1..
* performer.actor only Reference(Organization)

Profile: HealthLinkDiagnosticReport
Parent: DiagnosticReport
Title: "Health Link DiagnosticReport Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..
* status 1..
* category 1..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* code 1..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* subject 1..
* subject only Reference(Patient)
* effectiveDateTime 1..
* performer 1..
* performer only Reference(Organization) //we should check if there is at least 1 organization instead

Profile: HealthLinkObservation
Parent: Observation
Title: "Health Link Observation Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..
* status 1..
* category 0..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* code 1..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* subject 1..
* subject only Reference(Patient)
* effectiveDateTime 1..
* performer 1..
* performer only Reference(Organization) //we should check if there is at least 1 organization instead
* value[x] only string or Quantity
* valueString 0..1
* valueQuantity 0..1
* valueQuantity.value 1..
* valueQuantity.unit 1..
* interpretation 0..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..

Profile: HealthLinkEncounter
Parent: Encounter
Title: "Health Link Encounter Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..
* status 1..
* class 1..
* type 0..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* serviceType 0..1
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* subject 1..
* subject only Reference(Patient)
* period 1..
* period.start 1..
* reasonCode 0..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* diagnosis.condition 1..
* diagnosis.rank 1..
* serviceProvider 1..

Profile: HealthLinkVisitComposition
Parent: Composition
Title: "Health Link Visit Composition Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier.system = $hcodeURL
* identifier.use = #official
* identifier.value 1..
* status 1..
* type = http://loinc.org#18842-5
* subject 1..
* subject only Reference(Patient)
* encounter 1..
* date 1..
* author 1..
* author only Reference(Organization) //we should check if there is at least 1 organization instead
* title = "Visit Composition"
* event 1..
* event.code 1..
  * coding 1..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* event.period 1..
* event.period.start 1..
* section.title 1..
* section.code 1..
  * coding 1..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* section.entry 1..

Profile: HealthLinkIPSComposition
Parent: Composition
Title: "Health Link IPS Composition Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier.system = $hcodeURL
* identifier.use = #official
* identifier.value 1..
* status 1..
* type = http://loinc.org#60591-5
* subject 1..
* subject only Reference(Patient)
* date 1..
* author 1..
* author only Reference(Organization) //we should check if there is at least 1 organization instead
* title = "Visit Composition"
* section.title 1..
* section.code 1..
  * coding 1..
  * coding.system 1..
  * coding.code 1..
  * coding.display 1..
* section.entry 1..

Profile: HealthLinkDocumentReference
Parent: DocumentReference
Title: "Health Link DocumentReference Profile"
* ^date = "2022-04-05T18:00:00.0000000Z"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    mdp 1..1
* identifier[mdp].system = $hcodeURL
* identifier[mdp].use = #official
* identifier[mdp].value 1..
* status 1..
* subject 1..
* subject only Reference(Patient)
* author 1..
* author only Reference(Organization) //we should check if there is at least 1 organization instead
* content 1..
  * attachment 1..
* context 1..


// CodeSystem: TestCodeSystem
// Title: "Test code system"
// * ^url = $testCodeSystemURL
// * #001 "First code display"
// * #002 "Second code display"

// CodeSystem: TestCodeSystem2
// Title: "Test code system2"
// * ^url = $testCodeSystemURL2
// * #003 "Third code display"
// * #004 "Fourth code display"

// ValueSet: TestValueSet
// Title: "Test value set"
// * ^url = $testValueSetURL
// * include codes from system $testCodeSystemURL
// * include codes from system $testCodeSystemURL2