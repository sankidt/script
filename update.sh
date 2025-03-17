#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY��C�  �_�Tp}���~�ގ����  D   � P P.����t �jf�h�=F��@ Pѣ� hf�CLM p4d4ѡ�����&� �1 �Ҟ��m&S �&�h �1�  �P���zL�����@ 4  ��@	"L�&&��x@�O�=M=M���H���2b2<)���]c��짶h�����>�?>�
�nr���:��m)-N��,t&VҒ@�M��-��"2��j%Z(�U��p�z��a(e��7#\�W��J�/�R琅?P�E>��6+��7z�H�Q��%�l�0�}*h�ŝZ���,�K�`k�� PxiB�Q�4�eN�Bļsk�F�_�˹��D�I 裗�A�v�ۈ�6�+�zl2iS�"({�Ҫ4xɑ &�%�3鉸��qY���
=R��Q! ��WB_^�q��Q!0�9�F]H��+��Pm2���E�Ld�q��_?���}]A�t8jG_����ۥ���}����\�'8FsZY�}�s���F:ϴh�N�UK�
�_�,�0�����\7� V��`R�����7��:l�.r� �e�^JP���Zq�Y�Y>vNL��9�2d).�]���D>,U�;!����;L!���yf/(Ϧ���4END_�����у��oߩ���$���,'�h���I�6��!L���r�Z�c�9���p�Zd ��m�+�TRx"p�Y�!��PMD(9�:/��Y��0Ն�\>[n�8�ӍJ��,�%"�PA�h,B�����2�Hcg��\W�7+_:��g	���l�nf"xx{n1`U�n��#D�Y�lL�{Qyx����䐢i�g(Q�%��g�[�%=�Ij�V��1QZ�I��z��M[����5�M7d-��ٽF�s����S����=�ؐ%��@��.����gRI�L ����"�(H`I!� 