require 'test_helper'

class PolymorphicRender::ApplicationHelperTest < ActionView::TestCase
  include PolymorphicRender::ApplicationHelper

  setup do
    @post1 = Post.create title: 'My First Post'
    @post2 = Post.create title: 'I am Blogger!'
  end

  test 'simple rendering' do
    assert_equal "Title: My First Post\n", polymorphic_render(@post1)
  end

  test 'simple collection rendering' do
    assert_equal "Title: My First Post\nTitle: I am Blogger!\n", polymorphic_render(Post.all)
  end

  test 'namespaced rendering' do
    assert_equal "Edit: My First Post\n", polymorphic_render(@post1, :admin)
  end

  test 'complex namespaced rendering' do
    assert_equal "Edit: My First Post\n", polymorphic_render(@post1, ['', :admin])
    assert_equal "Destroy: My First Post\n", polymorphic_render(@post1, [:super, :admin])
  end

  test 'namespaced collection rendering' do
    assert_equal "Edit: My First Post\nEdit: I am Blogger!\n", polymorphic_render(Post.all, :admin)
  end
end
