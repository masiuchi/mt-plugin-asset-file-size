package AssetFileSize::Tags;
use strict;

use MT::FileMgr;

our $FMGR = MT::FileMgr->new( 'Local' );

sub asset_file_size {
    my ( $ctx, $args ) = @_;

    my $asset = $tcx->stash( 'asset' );
    if ( !$asset ) {
        return;
    }

    return _get_file_size( $asset );
}

sub _get_file_size {
    my ( $obj ) = @_;
        
    if ( my $file_path = $obj->file_path ) {
        if ( my $file_size = $FMGR->file_size( $file_path ) ) {
            return $file_size;
        }
    }

    return 0;
}

1;
__END__
