# encoding: utf-8

require File.expand_path('../../test_helper', __FILE__)

class TranslationForTest < Test::Unit::TestCase
  test "translation_for returns the translation for the locale passed in as an argument" do
    post = Post.create(:title => 'title', :content => 'content', :locale => :en)
    post.update_attributes(:title => 'Titel', :content => 'Inhalt', :locale => :de)

    assert_equal Post::Translation, post.translation_for(:en).class
    assert_equal 'title', post.translation_for(:en).title
    assert_equal 'content', post.translation_for(:en).content
    assert_equal 'Titel', post.translation_for(:de).title
    assert_equal 'Inhalt', post.translation_for(:de).content
  end

  test "translation returns the translation for the current locale" do
    post = Post.create(:title => 'title', :content => 'content', :locale => :en)
    post.update_attributes(:title => 'Titel', :content => 'Inhalt', :locale => :de)

    assert_equal Post::Translation, post.translation.class
    assert_equal Globalize.locale, post.translation.locale
    assert_equal 'title', post.translation.title
    assert_equal 'content', post.translation.content
  end
end


