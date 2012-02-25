package MT::Plugin::AssetFileSize;
use strict;
use base qw( MT::Plugin );

our $NAME = ( split /::/, __PACKAGE__ )[-1];

my $plugin = __PACKAGE__->new({
    name        => $NAME,
    id          => lc $NAME,
    key         => lc $NAME,
    l10n_class  => $NAME . '::L10N',
    version     => '0.01',
    author_name => 'masiuchi',
    author_link => 'https://github.com/masiuchi',
    plugin_link => 'https://github.com/masiuchi/mt-plugin-asset-file-size',
    description => '<__trans phrase="This plugin enables to get the file size of asset.">',
});
MT->add_plugin( $plugin );

sub init_registry {
    my ( $p ) = @_;
    $p->registry( 'tags', 'function', {
        AssetFileSize => '$'.$NAME.'::'.$NAME.'::Tags::asset_file_size',
    } );
}

1;
__END__
