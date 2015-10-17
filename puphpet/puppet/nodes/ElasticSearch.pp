class puphpet_elasticsearch (
  $elasticsearch
) {

  $settings = $elasticsearch['settings']
  $version  = $elasticsearch['settings']['version']

  if ! $settings['package_url'] {
    $url_base = 'https://download.elastic.co/elasticsearch/elasticsearch'

    case $::osfamily {
      'debian': {
        $url = "${url_base}/elasticsearch-${version}.deb"
      }
      'redhat': {
        $url = "${url_base}/elasticsearch-${version}.noarch.rpm"
      }
      default: {
        fail('Unrecognized operating system for Elastic Search')
      }
    }
  }
  else {
    $url = $settings['package_url']
  }

  if ! defined(Class['java']) and $settings['java_install'] {
    class { 'java':
      distribution => 'jre',
    }
  }

  $merged = delete(merge($settings, {
    'java_install' => false,
    'package_url'  => $url,
    require        => Class['puphpet::firewall::post'],
  }), 'version')

  create_resources('class', { 'elasticsearch' => $merged })

}
