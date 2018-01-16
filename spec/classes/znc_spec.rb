require 'spec_helper'

describe 'znc' do
  platforms = {
    'amazon_linux2' => {
      :facts_hash => {
        :osfamily => 'RedHat',
        :operatingsystem => 'Amazon',
        :operatingsystemmajrelease => '2',
        :os => {
          'family' => 'RedHat',
          'name'   => 'Amazon',
          'release' => {
            'major' => '2',
          },
        },
      },
    },
    'el7' => {
      :facts_hash => {
        :osfamily => 'RedHat',
        :operatingsystem => 'RedHat',
        :operatingsystemmajrelease => '7',
        :os => {
          'family' => 'RedHat',
          'release' => {
            'major' => '7',
          },
        },
      },
    }
  }

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

  describe 'with defaults' do
    platforms.sort.each do |k,v|
      context "#{k}" do
        let(:facts) do
          v[:facts_hash]
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('znc') }
        it { is_expected.to contain_class('znc::params') }
        it { is_expected.to contain_class('znc::install') }
        it { is_expected.to contain_class('znc::service') }

        it { is_expected.to contain_package('znc').with_ensure('installed') }

        if (v[:facts_hash][:os]['name'] == 'Amazon') and (v[:facts_hash][:os]['release']['major'] == '2')
          it 'manually sets provider to systemd' do
            is_expected.to contain_service('znc').with(
              'provider' => 'systemd',
            )
          end
        end

        it {
          is_expected.to contain_service('znc').with(
            'ensure'   => 'running',
            'enable'   => 'true',
          )
        }
      end
    end
  end
end
