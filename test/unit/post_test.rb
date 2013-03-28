require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "validations" do
    p = Post.new(:content => "A new post")
    assert !p.save
    assert p.errors.full_messages == ["Name can't be blank", "Title can't be blank", "Title is too short (minimum is 5 characters)"]

    p.name = "a name"
    assert !p.save
    assert p.errors.full_messages == ["Title can't be blank", "Title is too short (minimum is 5 characters)"]

    p.title = "ast"
    assert !p.save
    assert p.errors.full_messages == ["Title is too short (minimum is 5 characters)"]

    p.title = "a title"
    assert p.save

    p = Post.new(:name => "a name", :title => "a title", :content => "A new post")
    assert p.save

  end

end
