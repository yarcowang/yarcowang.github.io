GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex`      �      &�y���ڞu;>��.p$   res://buildings/Hatchery.gd.remap   �5      -       ��-�4/���M�   res://buildings/Hatchery.gdc       i      ��c�BK���}�5�    res://buildings/Hatchery.tscn   p
      U      ��JGh�b��'"�   res://default_env.tres  �      �       um�`�N��<*ỳ�8   res://globals/Game.gd.remap �5      '       F%u5�i�ܣ��J��   res://globals/Game.gdc  �      w      �r�2�R��A��b^3F$   res://globals/Selectable.gd.remap   6      -       ���0f�lZ�R���bt   res://globals/Selectable.gdc       D      ��<z��F�i�<s�T   res://globals/Test.gd.remap @6      '       �]�g���������   res://globals/Test.gdc  P      n      %4.A&��
�Cuy   res://globals/Test.tscn �      �      A��� :0��vX:�   res://icon.png  07      �      G1?��z�c��vN��   res://icon.png.import   @      �      ��fe��6�B��^ U�   res://items/Larva.gd.remap  p6      &       �/�+�C�OaV�̛��   res://items/Larva.gdc   �!      _      yGw��Z^P�EFfs   res://items/Larva.tscn  P%      �      Tͳ�@r��SD����    res://items/Zergling.gd.remap   �6      )       qsvߤ��9��k��   res://items/Zergling.gdc (      _      ���aU�`|�۟   res://items/Zergling.tscn   `*      �      0���{��jP�|��   res://project.binary D      L      �{�8V�	��8�c�-�   res://ui/Info.gd.remap  �6      "       +S'�FE��W��t�g   res://ui/Info.gdc   `,      �      8�D�� =�X3} ]��   res://ui/Info.tscn  @.      �      �K���Pp�#7h�͊+   res://ui/Operations.gd.remap 7      (       �k�k��+���[�+	   res://ui/Operations.gdc  1      L      ���a�+粉JY�   res://ui/Operations.tscnP3      `      R}$4�&�/8)�@�GDSC            �      ���������Ӷ�   ��������׶��   ���۶���   �����������¶���   �����϶�   ����¶��   ��������������������¶��   ���Ӷ���   �����������������������ﶶ��   ������������׶��   ����׶��   �������Ӷ���   �������ض���   ���������¶�   ��������Ҷ��   ����������Ŷ   ��������Ӷ��   �������������Ŷ�                             P        �?                   
                                 	   %   
   &      ,      4      8      9      ?      C      D      O      b      k      l      r      ~            �      �      3YY5;�  W�  Y5;�  W�  YY;�  VYY0�  PQV�  �  T�  PQYY0�  PQV�  &�  	�  T�  V�  �	  PQYY0�	  PQV�  �  �  Y�  ;�
  �  T�
  T�  PQ�  �
  T�  �  �  P�  P�  �  QR�  Q�  �  PQT�  P�
  QYY0�  PQV�  .�  T�  LM�  �  YY0�  PQV�  .LMY`       [gd_scene load_steps=3 format=2]

[ext_resource path="res://buildings/Hatchery.gd" type="Script" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 48, 48 )

[node name="Hatchery" type="Area2D"]
script = ExtResource( 1 )
life = 300

[node name="title" type="Label" parent="."]
margin_left = -29.0
margin_top = -64.0
margin_right = 28.0
margin_bottom = -50.0
text = "hatchery"
align = 1
valign = 1

[node name="item" type="ColorRect" parent="."]
margin_left = -48.0
margin_top = -48.0
margin_right = 48.0
margin_bottom = 48.0
mouse_filter = 2
color = Color( 0.945098, 0.447059, 0.113725, 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="new_larva" type="Timer" parent="."]
wait_time = 3.0

[connection signal="timeout" from="new_larva" to="." method="_on_new_larva_timeout"]
           [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDSC            Q      ���Ӷ���   �����������������������ﶶ��   ����׶��   �������϶���   �������������Ҷ�   �����¶�   �����������������¶�   ¶��   ߶��   �������¶���   ����������ڶ            res://items/Larva.tscn        res://buildings/Hatchery.tscn         target_changed                           	                           	       
   '      (      )      0      6      <      B      C      I      N      O      3YY:�  YY;�  V?P�  QY;�  V?P�  QYYYB�  Y;�  VLMYYY0�  P�  QV�  )�  �  V�  &�  �  V�  �  T�	  PQ�  �  �  L�  M�  �
  P�  Q�  Y`         GDSC         .   �      ���ׄ�   ���������Ӷ�   ���Ӷ���   ����������Ҷ   ��������   �������ն���   ����������Ŷ   ����ض��   �����������¶���   �������¶���   ����¶��   ��������ζ��   ����������������Ҷ��   �������������¶�   �����Ӷ�   ���Ӷ���   �����������������¶�   �������¶���   �������Ӷ���                                �?      select                                                            	      
                                                          &      *      F      G      H      S      ]      _      `      e      i      m      n       r   !   s   "   y   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   3Y2�  YY8;�  VYY;�  V�  YYYYYYYYYYYYY0�  PQV�  &�  V�  �  P�  PRQR�  PQRR�  ZR�  R�  T�  R�  Q�  YY0�  P�	  R�
  R�  QV�  &�
  T�  P�  QV�  .�  �  �  �  �  &�  V�  �  PQ�  �  �  PQ�  Y0�  PQV�  �  T�  PQ�  Y0�  PQV�  �  �  �  �  PQ�  Y0�  PQV�  .�  �  Y0�  PQV�  .�  Y`            GDSC   
          0      ���ӄ�   ������釶���   �����ć�   �����϶�   ޶��   ���Ӷ���   �������϶���   �������Ӷ���   �������ض���   ��������Ҷ��                   
                        %      *   	   +   
   ,      -      .      3YY5;�  W�  YY0�  PQV�  ;�  V�  T�  T�  PQ�  �  T�  �  T�  �  �	  P�  Q�  �  YYY`  [gd_scene load_steps=4 format=2]

[ext_resource path="res://ui/Info.tscn" type="PackedScene" id=1]
[ext_resource path="res://ui/Operations.tscn" type="PackedScene" id=2]
[ext_resource path="res://globals/Test.gd" type="Script" id=3]

[node name="Test" type="Node2D"]
script = ExtResource( 3 )

[node name="Player1" type="Position2D" parent="."]
position = Vector2( 150, 300 )

[node name="Info" parent="." instance=ExtResource( 1 )]
margin_left = 330.0
margin_top = 599.0
margin_right = 330.0
margin_bottom = 599.0

[node name="Operations" parent="." instance=ExtResource( 2 )]
margin_left = 707.0
margin_top = 523.0
margin_right = 707.0
margin_bottom = 523.0
            GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              GDSC            �      ���������Ӷ�   ���۶���   �������������Ŷ�   ��ڶ   ������ڶ   ����   ���¶���   ��������¶��   �������Ӷ���   ����Ķ��   �����Ӷ�   ��������Ҷ��   ����Ӷ��   ����ڶ��   ���¶���   ����Ӷ��   �������������ӄ򶶶�   ������Ŷ   �������Ӷ���   ��ڶ   �������������ӄ򶶶�            Zergling                   
                                 	   %   
   1      9      @      A      J      P      W      X      a      k      t      z      �      �      �      3YY5;�  W�  YYY0�  PQV�  ;�  �  T�  PQ�  �  ;�  �  T�  PQ�  �  T�  P�  PRQQ�  �  T�	  �  T�
  �  �  T�  P�  Q�  �  ;�  �  T�  PQ�  �  T�  �  �  �  T�  P�  Q�  �  ;�  �  T�  PQ�  �  T�  �  T�  PQ�  ;�  �  T�  PQ�  �  T�  �  �  �  T�  P�  QY�  .L�  MY` [gd_scene load_steps=3 format=2]

[ext_resource path="res://items/Larva.gd" type="Script" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 8, 8 )

[node name="Larva" type="Area2D"]
script = ExtResource( 1 )
life = 10

[node name="title" type="Label" parent="."]
margin_left = -20.0
margin_top = -21.0
margin_right = 20.0
margin_bottom = -7.0
text = "larva"
align = 1
valign = 1

[node name="item" type="ColorRect" parent="."]
margin_left = -8.0
margin_top = -8.0
margin_right = 8.0
margin_bottom = 8.0
mouse_filter = 2
color = Color( 0.945098, 0.447059, 0.113725, 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
       GDSC            U      ���ׄ�   ���������¶�   ��������¶��   �������Ҷ���   ��������   �������ն���   ����Ķ��   �����������¶���   �������¶���   ����¶��   ��������ζ��   ����������������Ҷ��                   @A                  �?      select                     
                                 	   6   
   7      8      9      D      M      Q      R      S      3YY5;�  W�  YY;�  VYY0�  PQV�  &�  V�  �  P�  P�  R�  QR�  R�  R�  ZR�  R�  T�  R�  Q�  �  �  Y0�  P�  R�	  R�
  QV�  &�	  T�  P�  QV�  �  �  �  �  Y` [gd_scene load_steps=3 format=2]

[ext_resource path="res://items/Zergling.gd" type="Script" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 8, 8 )

[node name="Zergling" type="Area2D"]
script = ExtResource( 1 )

[node name="ColorRect" type="ColorRect" parent="."]
margin_left = -8.0
margin_top = -8.0
margin_right = 8.0
margin_bottom = 8.0
color = Color( 0.945098, 0.447059, 0.113725, 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
        GDSC   
         F      ������ڶ   ���Ӷ���   �����϶�   ���Ӷ���   ������¶   �����������ٶ���   �����¶�   ���Ӷ���   ���¶���   �������Ӷ���      target_changed        _update_info            Life:                             
                              #   	   $   
   0      D      3YY5;�  W�  YY0�  PQV�  �  T�  PRR�  Q�  Y0�  PQVY�  &�  T�  T�  PQ�  V�  �  T�  �  �>  P�  T�  L�  MT�	  PQQY`             [gd_scene load_steps=2 format=2]

[ext_resource path="res://ui/Info.gd" type="Script" id=1]

[node name="Info" type="Control"]
script = ExtResource( 1 )

[node name="ColorRect" type="ColorRect" parent="."]
margin_left = -120.0
margin_top = -80.0
margin_right = 180.0
color = Color( 0.0235294, 0.00392157, 0.00392157, 1 )

[node name="title" type="Label" parent="."]
margin_left = -117.0
margin_top = -77.0
margin_right = -3.0
margin_bottom = -63.0
text = "Information Panel"

[node name="life" type="Label" parent="."]
margin_left = -99.0
margin_top = -57.0
margin_right = -19.0
margin_bottom = -43.0
grow_vertical = 0
rect_min_size = Vector2( 80, 0 )
align = 1
valign = 1
autowrap = true
               GDSC            X      ������ڶ   ������Ŷ   �����϶�   ���Ӷ���   ������¶   ��������������Ŷ   ���Ӷ���   �����������ض���   ���������Ӷ�   �����¶�   ���Ӷ���   ߶��   �������������Ŷ�   ��������Ҷ��      target_changed        _update_buttons                                 
                              #   	   -   
   3      4      @      O      V      3YY5;�  W�  YY0�  PQV�  �  T�  PRR�  Q�  Y0�  PQV�  )�  �  T�  PQV�  �  T�  PQ�  �  &�  T�	  T�
  PQ�  V�  )�  �  T�	  L�  MT�  PQV�  �  T�  P�  QY`    [gd_scene load_steps=2 format=2]

[ext_resource path="res://ui/Operations.gd" type="Script" id=2]

[node name="Operations" type="Control"]
script = ExtResource( 2 )

[node name="ColorRect" type="ColorRect" parent="."]
margin_left = -90.0
margin_top = -90.0
margin_right = 90.0
margin_bottom = 90.0
color = Color( 0, 0, 0, 1 )

[node name="title" type="Label" parent="."]
margin_left = -86.0
margin_top = -85.0
margin_right = 17.0
margin_bottom = -71.0
text = "Operation Panel"

[node name="buttons" type="Control" parent="."]
margin_left = -72.0
margin_top = -57.0
margin_right = -72.0
margin_bottom = -57.0
[remap]

path="res://buildings/Hatchery.gdc"
   [remap]

path="res://globals/Game.gdc"
         [remap]

path="res://globals/Selectable.gdc"
   [remap]

path="res://globals/Test.gdc"
         [remap]

path="res://items/Larva.gdc"
          [remap]

path="res://items/Zergling.gdc"
       [remap]

path="res://ui/Info.gdc"
              [remap]

path="res://ui/Operations.gdc"
        �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes�                     class      
   Selectable        language      GDScript      path      res://globals/Selectable.gd       base      Area2D     _global_script_class_icons$            
   Selectable            application/config/name      	   Starcraft      application/run/main_scene          res://globals/Test.tscn    application/config/icon         res://icon.png     autoload/Game          *res://globals/Game.gd     display/window/size/width            display/window/stretch/mode         2d     display/window/stretch/aspect         keep)   global/max_remote_stdout_chars_per_second          +   gui/common/drop_mouse_on_gui_input_disabled            input/select�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script      )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres      