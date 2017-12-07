# frozen_string_literal: true

obligations = [
  {
    title: 'Adopter un code de conduite, intégré au règlement intérieur',
    category: 0,
    tasks: [
      'Adopter une charte éthique',
      'Adopter un code de comportement face à la corruption'
    ]
  },
  {
    title: 'Mettre en œuvre un dispositif d’alerte interne',
    category: 0,
    tasks: [
      'Evaluer une pratique répréhensible',
      'Mettre à task des moyens d\'alerte',
      'Conserver l\'anonymat des alertes',
      'Désigner les responsables habiliter à traiter les alertes',
      'Mettre en place un suivi des alertes et des traitements',
      'Evaluer l\'efficacité du traitement des signalements'
    ]
  },
  {
    title: 'Établir une cartographie des risques (régulièrement actualisée)',
    category: 1,
    tasks: [
      'Réaliser une liste des risques en relation avec l\'activité',
      'Établir une cartographie des risques (régulièrement actualisée avec les risques de '\
      'sollicitations externes en fonction du secteur d’activité et des zones géographiques)'
    ]
  },
  {
    title:
      'Instaurer une procédure d’évaluation des clients, '\
      'fournisseurs de 1er rang et intermédiaires',
    category: 1,
    tasks: [
      'Instaurer une procédure d’évaluation des clients',
      'Instaurer une procédure d’évaluation des fournisseurs de 1er rang',
      'Instaurer une procédure d’évaluation des intermédiaires'
    ]
  },
  {
    title: 'Effectuer des contrôles comptables internes ou externes',
    category: 1,
    tasks: [
      'Effectuer des contrôles comptables internes ou externes'
    ]
  },
  {
    title: 'Former les cadres de la société ainsi que les personnels les plus exposés',
    category: 1,
    tasks: [
      'Former les cadres de la société ainsi que les personnels les plus exposés'
    ]
  },
  {
    title: 'Instaurer une politique de sanctions disciplinaires',
    category: 1,
    tasks: [
      'Instaurer une politique de sanctions disciplinaires'
    ]
  },
  {
    title: 'Instaurer un dispositif de contrôle et d’évaluation interne des mesures prises',
    category: 1,
    tasks: [
      'Instaurer un dispositif de contrôle et d’évaluation interne des mesures prises.'
    ]
  }
]

obligations.each do |obligation|
  new_obligation = Obligation.find_or_create_by!(obligation.slice(:title, :category))
  ap new_obligation
  obligation[:tasks].each do |task_title|
    task = new_obligation.tasks.find_or_create_by!(title: task_title)
    ap task
  end
end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com',
                    password: 'password', password_confirmation: 'password')
end
