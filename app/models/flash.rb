class Flash
  GOOD_TERMS = [
    'Good',
    'Great',
    'Alright',
    'Decent',
    'Pretty alright',
    'Right on',
    'Cool',
  ].freeze

  BAD_TERMS = [
    'Bad',
    'Uh oh',
    'No good',
    'Frig',
    'Argh',
    'Doye',
    'Bad news',
    'Problem',
  ].freeze

  NAME_TO_CLASS = {
    notice: 'info' 
  }.with_indifferent_access.freeze
end