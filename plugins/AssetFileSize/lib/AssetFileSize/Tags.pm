package AssetFileSize::Tags;
use strict;

use MT::FileMgr;

our $FMGR = MT::FileMgr->new( 'Local' );

sub asset_file_size {
    my ( $ctx, $args ) = @_;

    my $asset = $ctx->stash( 'asset' );
    if ( !$asset ) {
        return;
    }

    return _get_file_size( $asset );
}

sub if_asset_file_size {
    my ( $ctx, $args, $cond ) = @_;

    my $asset = $ctx->stash( 'asset' );
    if ( !$asset ) {
        return;
    }

    my $file_size = _get_file_size( $asset );

    if ( my $value = $args->{eq} ) {
        if ( !( $file_size == $value ) ) {
            return 0;
        }
    }

    if ( my $value = $args->{ne} ) {
        if ( !( $file_size != $value ) ) {
            return 0;
        }
    }

    if ( my $value = $args->{lt} ) {
        if ( !( $file_size < $value ) ) {
            return 0;
        }
    }

    if ( my $value = $args->{gt} ) {
        if ( !( $file_size > $value ) ) {
            return 0;
        }
    }

    if ( my $value = $args->{le} ) {
        if ( !( $file_size <= $value ) ) {
            return 0;
        }
    }

    if ( my $value = $args->{ge} ) {
        if ( !( $file_size >= $value ) ) {
            return 0;
        }
    }

    return 1;
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
