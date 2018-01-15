require 'spec_helper'

describe 'znc' do
  context 'on unsupported os family' do
    let(:facts) do
      {
        os: { family: 'Unsupported' }
      }
    end

    it 'fails' do
      expect { catalogue }.to raise_error(Puppet::Error, %r{ZNC module not supported on Unsupported})
    end
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      describe 'with defaults' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('znc') }
        it { is_expected.to contain_class('znc::params') }
        it { is_expected.to contain_class('znc::package') }
        it { is_expected.to contain_class('znc::service') }

        it { is_expected.to contain_package('znc').with_ensure('installed') }

        it {
          is_expected.to contain_service('znc').with(
            'ensure' => 'running',
            'enable' => 'true',
          )
        }
      end
    end
  end
end
