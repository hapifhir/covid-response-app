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

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'patientId': patientId,
      'patient': patient,
      'episodeOfCare': episodeOfCare,
      'questionnaireResponse': questionnaireResponse,
      'careTeam': careTeam,
      'encounter': encounter,
      'consent': consent
    };
    return map;
  }

  factory FHIRResources.fromJson(Map<String, dynamic> json) {
    return FHIRResources(
      patientId: json['patientId'] as int,
      patient: json['patient'] as String,
      episodeOfCare: json['episodeOfCare'] as String,
      questionnaireResponse: json['questionnaireResponse'] as String,
      careTeam: json['careTeam'] as String,
      encounter: json['encounter'] as String,
      consent: json['consent'] as String,
    );
  }
}
