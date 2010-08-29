Factory.define :tagging do |tagging|
  tagging.association :tag
  tagging.association :tweet
end