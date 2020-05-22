class FHIRResources {
  int patientId;
  String patient;
  String episodeOfCare;
  String questionnaireResponse;
  String careTeam;
  String encounter;
  String consent;

  FHIRResources(
      {this.patientId,
      this.patient,
      this.episodeOfCare,
      this.questionnaireResponse,
      this.careTeam,
      this.encounter,
      this.consent});
}
