class MnoCrew < ActiveRecord::Base
  maestrano_group_via :provider, :uid, :tenant do |group,maestrano|
    group.name = maestrano.company_name || "Your Group"
  end
end
