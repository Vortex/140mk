require 'spec_helper'

describe ApplicationHelper do

  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(ApplicationHelper)
  end

  describe 'autolinking hashtags' do

    it 'should return empty string for blank text' do
      text = ''
      result = helper.auto_link_hashtags(text)
      result.should == ''
    end

    it 'should return the link to hashtag for text with hashtag #zoo' do
      # Create some tag
      tag = Tag.create(:name => "zoo")

      text = 'nicey nicey #zoo'
      result = helper.auto_link_hashtags(text)

      result.should == "nicey nicey #{helper.link_to '#' + tag.name, tag}"
    end

    it 'should return the text as is if hashtag doesn\'t exist' do
      text = 'welcome to the #unknown'

      result = helper.auto_link_hashtags(text)
      result.should == text
    end

    it 'should return the text with just the link for the existing hashtag' do
      # Create some tag
      tag = Tag.create(:name => "trololo")

      text = 'Trolololo trolololo looooo #trololo #best'
      result = helper.auto_link_hashtags(text)

      result.should == "Trolololo trolololo looooo #{helper.link_to '#' + tag.name, tag} #best"
    end

    it 'should return links for both hashtags' do
      # Create some tags
      tag1 = Tag.create(:name => "maiden")
      tag2 = Tag.create(:name => "thefinalfrontier")

      text = "I'm a jester without tears and I'm playing on your fears #maiden #thefinalfrontier"
      result = helper.auto_link_hashtags(text)

      result.should == "I'm a jester without tears and I'm playing on your fears #{helper.link_to '#' + tag1.name, tag1} #{helper.link_to '#' + tag2.name, tag2}"
    end
    
  end

end