require 'spec_helper'

describe 'znc::znc_user' do
  let(:title) { 'testuser' }
  let(:params) do
    {
      'salt'     => '01234567890123456789',
      'password' => 'testpass'
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
