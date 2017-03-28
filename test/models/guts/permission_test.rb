require 'test_helper'

module Guts
  class PermissionTest < ActiveSupport::TestCase
    test 'should add permission to user and group' do
      [guts_users(:admin_user), guts_groups(:admins)].each do |obj|
        permission = Permission.new(
          permissionable: obj,
          resource: 'guts_user',
          grant: 'index'
        )

        assert permission.save
      end
    end

    test 'should not add if missing permissionable' do
      permission = Permission.new(
        resource: 'guts_user',
        grant: 'index'
      )

      assert_not permission.save
    end

    test 'should not add if missing resource or grant' do
      permission   = Permission.new(resource: 'guts_user')
      permission_2 = Permission.new(grant: 'index')

      assert_not permission.save
      assert_not permission_2.save
    end
  end
end
