#!/bin/bash
case "$1" in
    thaw|resume)
        /home/dpiwowarski/Perl/proper_resolution_afet_suspend/fix_res.pl
        ;;
    *)
        ;;
esac
exit $?
