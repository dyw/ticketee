class Admin::UsersController < Admin::BaseController
  before_filter :authorize_admin!
end
