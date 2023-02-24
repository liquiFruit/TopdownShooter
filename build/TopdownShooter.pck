GDPC                  �
                                                                         P   res://.godot/exported/133200997/export-3c5491bc1cb430bead51b94ed5d36eda-game.scn�      ^      $T�<z��l����    T   res://.godot/exported/133200997/export-42beae71e6dd8be1222da04ec3fae74d-player.scn  @      L      >X^.�"�8��H1�z�    X   res://.godot/exported/133200997/export-8ea4c9fcd0fdba806e37b6be6983ddf2-projectile.scn        *      e�q%�(�����n    P   res://.godot/exported/133200997/export-a8ffa8455ee75708b6c34cd8d7888dc7-test.scn@!      o      �_�H+�`I�ԕ]    T   res://.godot/exported/133200997/export-d9f76d5a970f0c7d748d9d68b2f47ee7-lobby.scn   �      w      {���*�J�p�*K<    T   res://.godot/exported/133200997/export-e8447e6724d1bd2b40f00fb2ff1f13fd-obstacle.scn      �      �q��Z�����WJ_*T    ,   res://.godot/global_script_class_cache.cfg                 ��Р�8���8~$}P�    H   res://.godot/imported/aimer.PNG-f84f1186c27ddcfa95a73f95908cd689.ctex   �$      N      ���P�����60�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex �      ^      2��r3��MgB�[79    H   res://.godot/imported/obstacle.PNG-32b92e047661299298fecf4b85d098c5.ctex )      �      �����Y|�
�}    H   res://.godot/imported/player.PNG-b3a6a3ed61d5cb4dae78911a5ab50237.ctex  �-      �=      �P�X���d�#Ƙ3��    L   res://.godot/imported/projectile.PNG-ca87f1beb99b126975dc794f50d4b464.ctex  �n      �      �_މa���
q���\$�       res://.godot/uid_cache.bin  ��      �      ^��Bh�핒��[�       res://game/game.gd          |      ���o��A���8�3       res://game/game.tscn.remap  Е      a       J��[�5j�~5�UP       res://globals.gd��      d       �!��jiQp2(�Pc�       res://icon.svg  p�      N      ]��s�9^w/�����       res://icon.svg.import   ��      K      �J�w��	yN���#6�       res://lobby/lobby.gd       �      ��(<8N,&Wn�r��       res://lobby/lobby.tscn.remap@�      b       ���-��,�j;�6    $   res://objects/obstacle.tscn.remap   ��      e       [ՍiY�=�ߘc��    $   res://objects/projectile.tscn.remap  �      g       �V��@�+6�6�8��       res://players/player.gd �       �       ���g�+#OKЕԳ�        res://players/player.tscn.remap ��      c       �z]���7����2�       res://project.binaryp�      �      �] ��	�[��?>       res://scenes/test.tscn.remap �      a       F�^�h�����{�        res://sprites/aimer.PNG.import   &      �      (L����o`��d��V�    $   res://sprites/obstacle.PNG.import   �*      �      �0��ch�S5N��7P�        res://sprites/player.PNG.import �k      �      ����l�@��[�    $   res://sprites/projectile.PNG.import ��            |rw�G E�(�X�h�
    i��DT2list=Array[Dictionary]([])

�߉wextends Node2D

const PLAYER_PREFAB : PackedScene = preload("res://players/player.tscn")
var multiplayer_peer:= ENetMultiplayerPeer.new()


func _ready():
	if Globals.is_server:
		multiplayer_peer.create_server(4200)
		multiplayer_peer.peer_connected.connect(spawn_player)
		spawn_player(1)
	else: 
		multiplayer_peer.create_client(Globals.server_ip, 4200)
	
	multiplayer.multiplayer_peer = multiplayer_peer

func spawn_player(id: int):
	var player = preload("res://players/player.tscn").instantiate()
	player.name = str(id)
	player.position = randf_range(-500, 500) * Vector2(randf(), randf()).normalized()
	$Players.add_child(player)
��{[RSRC                     PackedScene            ��������                                                  ..    resource_local_to_scene    resource_name 	   _bundled    script       Script    res://game/game.gd ��������      local://PackedScene_vqkbf          PackedScene          	         names "         Game    script    Node2D 	   Camera2D    Players    MultiplayerSpawner    _spawnable_scenes    spawn_path    	   variants                 "         res://players/player.tscn                 node_count             nodes     "   ��������       ����                            ����                      ����                     ����                         conn_count              conns               node_paths              editable_instances              version             RSRCd�extends Control

@onready var server_ip = $CenterContainer/VBoxContainer/ConnectionInfo/ServerAddress
@onready var color_slider = $CenterContainer/VBoxContainer/CharacterCustomisation/VBoxContainer/PlayerColorSlider
@onready var sprite_preview = $CenterContainer/VBoxContainer/CharacterCustomisation/SpritePreview


func _load_game():
	Globals.server_ip = server_ip.text
	Globals.is_server = server_ip.text == "localhost"
	Globals.player_color = sprite_preview.modulate
	get_tree().change_scene_to_file("res://game/game.tscn")


func _on_player_color_slider_value_changed(value):
	sprite_preview.modulate = Color.from_hsv(value/100.0, 1, 1)
8���T9 .`��5�\RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://lobby/lobby.gd ��������
   Texture2D    res://sprites/player.PNG <�~�t      local://PackedScene_fu2di ?         PackedScene          	         names "   '      Lobby    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    CenterContainer    anchor_left    anchor_top    offset_left    offset_top    offset_right    offset_bottom    VBoxContainer    CharacterCustomisation    HBoxContainer    size_flags_vertical    Label    text    PlayerColorSlider    custom_minimum_size    HSlider    SpritePreview    size_flags_horizontal    texture    expand_mode    TextureRect    ConnectionInfo    ServerAddress 	   LineEdit    PlayButton    Button &   _on_player_color_slider_value_changed    value_changed    _load_game    pressed    	   variants                        �?                                  ?     S�     '�     SC     'C            Player Color 
     HC    
     HC  HC         
     C       
   localhost       JOIN       node_count             nodes     �   ��������       ����                                                          	   	   ����               
                                 	      
                                      ����                          ����                          ����                                ����                                ����                                ����                                                        ����                                       ����                                "   !   ����                         conn_count             conns               $   #              
       &   %                    node_paths              editable_instances              version             RSRCx��e��YRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled    
   Texture2D    res://sprites/obstacle.PNG ('~���TN      local://RectangleShape2D_dlkk5 `         local://PackedScene_ayr2c �         RectangleShape2D       
     �C  �C         PackedScene          	         names "   	   	   obstacle    CharacterBody2D    MultiplayerSynchronizer    CollisionShape2D    shape 	   Sprite2D 	   modulate    scale    texture    	   variants                                  �?
      ?   ?                node_count             nodes     $   ��������       ����                      ����                      ����                            ����                               conn_count              conns               node_paths              editable_instances              version             RSRC���f*?��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    height    script 	   _bundled    
   Texture2D    res://sprites/projectile.PNG +�gz���@      local://CapsuleShape2D_qtofd m         local://PackedScene_yt3m2 �         CapsuleShape2D            �A        �C         PackedScene          	         names "   
      projectile    CharacterBody2D    MultiplayerSynchronizer    CollisionShape2D    shape 	   Sprite2D 	   modulate 	   rotation    scale    texture    	   variants                    �y?�y?      �?   ��?
   33�>33�>                node_count             nodes     &   ��������       ����                      ����                      ����                            ����                     	                conn_count              conns               node_paths              editable_instances              version             RSRC/���wRSRC                     PackedScene            ��������                                                  . 	   position    aimer 	   modulate    resource_local_to_scene    resource_name    properties/0/path    properties/0/spawn    properties/0/sync    properties/1/path    properties/1/spawn    properties/1/sync    script    script/source    custom_solver_bias    radius 	   _bundled       Script    res://players/player.gd ��������
   Texture2D    res://sprites/player.PNG <�~�t
   Texture2D    res://sprites/aimer.PNG yg�-��iH   %   local://SceneReplicationConfig_ynqvb �         local://GDScript_xmye3 S         local://CircleShape2D_ucqwo �         local://PackedScene_8w4kk �         SceneReplicationConfig                                     	              
                        	   GDScript          J   extends MultiplayerSynchronizer

func _ready(): print(get_parent().name)
    CircleShape2D          9dC         PackedScene          	         names "         player    script    CharacterBody2D    MultiplayerSynchronizer    replication_config    CollisionShape2D    visible    shape    body    scale    texture 	   Sprite2D    aimer 	   modulate 	   position 	   rotation    	   variants                                                    
      ?   ?                ��?��^?  �?
        ���   ��?               node_count             nodes     ;   ��������       ����                            ����                                 ����                                 ����   	      
                        ����                  	   	      
   
             conn_count              conns               node_paths              editable_instances              version             RSRC *�`extends CharacterBody2D


func _enter_tree():
	set_multiplayer_authority(str(name).to_int())
	if is_multiplayer_authority():
		$aimer.modulate = Globals.player_color
��KYN�twެRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene    res://players/player.tscn yUcrr}ui   PackedScene    res://objects/projectile.tscn ����M�%      local://PackedScene_7nn30 P         PackedScene          	         names "         Node2D 	   Camera2D    zoom    player 	   position    projectile    	   variants       
   �k>�k>          
      �  ��         
     �� �i�      node_count             nodes     "   ��������        ����                      ����                      ���                           ���                         conn_count              conns               node_paths              editable_instances              version             RSRC�GST2   �  �     ����               ��         RIFF  WEBPVP8L  /�Bd70��?�d�ɽ��%��!
W�$)֜��s�HIx� �� 3���Î�´mw藈�%��Pg��E��\��L�"�g�M�Ҕ-�Ґ.E��R�KC��R�K0I��D̑q+��g��✞m%�s�J) ����g�������?�����g�������?�����g�������?�����g������WJ�9�9=Ա�}F�0n6:�0h�X�
b�b��`3|� �Oോ^#2x�^+t����� r[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cgluofj8jmnhh"
path="res://.godot/imported/aimer.PNG-f84f1186c27ddcfa95a73f95908cd689.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/aimer.PNG"
dest_files=["res://.godot/imported/aimer.PNG-f84f1186c27ddcfa95a73f95908cd689.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
R����+��ݖGST2   w  w     ����               ww       �  RIFF�  WEBPVP8Lw  /v��70��?�d�ɽ��%��!
X�m�n�M��
( h �_å�~�Ҋ�´mu���Xe����23���^.��c]���gT.��y�eZ`�Y&E���2�YJ_h)}��t��ҕZJ+��Vl)�ܲ8�sY��+<ߐ��/�O2s�[UP�����O��?��������O��?��������O��?��������O��?��������O��?��������O��?��������O��?��������O��?��������O��?��������O��?��������O��?����߯`旪�2���F��c������͡���Kr�!K��V�r�&_��ia֦Y�Uf͈.��Z�@�d�Y'�!5�� � �gK��OP���[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cmoes7dgqrc2c"
path="res://.godot/imported/obstacle.PNG-32b92e047661299298fecf4b85d098c5.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/obstacle.PNG"
dest_files=["res://.godot/imported/obstacle.PNG-32b92e047661299298fecf4b85d098c5.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
��GST2   �  �     ����               ��       �=  RIFF�=  WEBPVP8L�=  /���0n#)RU�aCC��7"&�m9(usg��C � S���v��u��`���E����i�<q�p8kr��$Ir#i��i&Z&P �A���G�����l"d%���Rڥ]����]T
q�n:%�h�$�=�vhXee�?_��d�m�ދ�䂒�"����P�$ɑ$-�L끈�����
���K���8P��s�k��uw��zv���Ѕ�8���~��a�-I��F�V0 �05{�~�?zAqp������Xjw^|��"�.{:����;l�o�<�Xi;�I�����51����s�'�)���+5Z��@�:4x��b���ef���}�z|-!S3���	��x�� �2�}P(]��,2�N�$އ��a`&WAι�NX=��<�&�-����nK���J�\\.FU����,t�S�;.�+p�`�V)�3rPa�O�f��@3�KP�#
��?��R4��8~�}šA�>�Jtv��z5s�sM59�bP���������ymK�Vw�;��xܓ�~�����������(�����݇a�Y�WD�D�L��Q��N�[�`�}r��_��5�Ԯ��z����r�+�S�~���vL�A���$^�L�:g�MvH�!���e�i�,w�a�O�N�KC�B���'&~�3T�r�7��cP�}�`�'~�3�xB
x��l%�㉟�������C�lcp<�㛡�[�^x�^8[�É��� ��m�Z�8�a鈷�L��uk	'~i3���'���Q��MΘ�Zx>!�ˇ�����������b�s&<*~Y3z�*��Y�{4�h��	<�hw���įi�W�$�آA�_Rq�1�K����+����&�A�8�3<����X�ϧ³�=Rx���$�_���AX��3�pP�h*|n���N���Le���c�b�p&~*�U³�Va�����	��o��Z��_�D*�ܸ���Ѣ�'��W�X�,�R$�-\�@~�)F�$�2�(�
u���h[?�\|�����.���IM�OJd��`۹s4�}JX��&S�ͷ�F��:+M�����D�8��FE�!�p��������y���F˄"�V�,^��~���;�s��?������A�=p�1�����6=Ӭ�[�[^�y��%�/~3^���\s���t1�b!dm�=�����r'h�?��2\����G���x���Lh��On�����W~}�,���wPڮ�*�9d%3����~���&1h�k��u����'M�]ri�yNYo4֜�W��@����zs�����-��P���}���AѮ�\�/�q��*�}�B'����WL]%��
8w2�r����s^Ϋ��2_y���b&�J�AOEqb����v�3�qS��
�|qw�w^��~��r:ܶ�d��ko�Ki[#N�u&���v��]�v��ͮ��
�����M�X"³�|�����]o�ʄK�Wy1�|���{S
�8���4�N�[�犹[�Xb�m̾�w�7�h�(�.Q���q�b �VG�T�i8���/�E��$?�/|��~��#Y���8g)����!7�0����C�-�썗[Q���l9�
�;�h�aV���⅗v'_lE�A־6C*g�����vaLpī�?XWh�n�R7�K_���3�����}[�����GĲ��/��X�����9����E����;���6��²Q�0������Eh�t=���o�ʊ�d�eg�gtz�_=�g���.�!;g�^�7JBQ�8��3��52������/z�6?�]��	��3O`e^,z��l&�@{a�͚��8o&�ə1A�Oa���f��m��Â!�k-�ə�1�T��%/��3^\��~X�j�F��y������\O��{�_�S�}��G"[̹��9@��|��"ͽ���m�=���	¯g�;��V�.�����P�r��ų:7�H(��b��3����qT��k>�n�T�u~���/��/֊~�L87�&�֊6{3���W��K�U ��3��tS�-v�b�{G�+�LY�	�CK��TOn�'��J!r�`�x=��a!]buf��|�[��������lV�	E� �g�G8�1[�R�����S�rs��8㞝y�7g"~����n��x+��X�B�1���,h
ѹ��.t���wrnƽ�֚�e:Q=�	�vj\h�36/d���u.ir�鉙�Z���q�B>ý#�]T�(%�J�s\=����u���N����v�"iWϷ�H�2�G�v�����W ��_1�OTOxc���Lڸ�-_���{��+��=�s�e�O�����y�UʓHdp\=낋X#:vϥ>�%F~�H]e|\=����ҩ�=�~�,	��t���G^�ڨ��fw�'����!$��q��<[5�q��S?��^u9N+�c�q��;���#�g~�-���
qߤ�����i_�|��O�����=���T�!����}8���v�v����P�X ~rx�G�2a��m$��V���`����q�Q����n"�O.���m8�����S>��6�Vx��ʢ���œ����[h�d�0�.;p��2K�0?��n��of����:K�z1��/�F>�CmC������r
<{t�_No�=�Ж1��l�Y�9��OA�E��?V ���ڲ� L��>���d�b���Ϻkh�`�%,n�9�^S��&Ǻ�o�nh#�O��
t�������/b�zЅC[fk�ɜ�W�c	�:�9�Ϲs;/��$��T�;�^XAљ�?S�k�_�6(H��!v�`{i������r�)7o�O�0��l���V�
�w�.��h�a*�v`W�m�h�07������k�1�{���`��'�@�G�	7p煓����p�V�o��05��?��\[���B�`�%V�	3�����Ýw3��L�-<���2���/o��hsu�L.v���¼���^����H�5��4dO:�m��8�E���Y`�ꇉ���h+�6s�#����wZ�l�)u�O��h��J�H����k���a^ �<�b���^�B��p�ق�F�����;�3�2X�v��;��1u] ��ZN�a�!�G�����3?�Dx��D��E�����p�����3m(��3�1f�_�����k+,���N1�[71��{.ت�iAs��mPR�h=X���%�M|���-*ڠ���Ԉ��edѼ��=Ϯ�#U�����o�0������h�ż�� ���Z�����YX�a�v��wc���^���xY"Ի���U��`�Ԏ��>i���ֿ����h�"���1�������u�o��h�L⏥��oP�5m���"��6���$ɝ��o`N{V�G�=�m�
�"��L&@d��i�H������aL���K����'��6�$������I1M�%vx���1�D3����A���#���>k�s<�a�-0'��
93�)7Щ<��G���*�A��9��*
f�{�_ a0�-��eB\W`N,���:��ad��R!�a��n��hC0̡���`��M�9$O���<\Ǣq�,�0%f�n��h��I_Щt��w�S���h��I��<N�CZ^LZH�֋�6l�)�\>�J�d��!t����L�|·uTO�D,�s�.�o7��H3�F<R�u���o���_�A9�SI�b}sq����D=0��PǢr�8?aF�/��h�B;���TZd�fD�^�!��`n���HO����7�s4��딫˼:�J����2��s�ш�˽S���S�G�����؜���)������}{�Y:L`���H�.L��7�w�!&@gp*:�	b���6m�	P���lI0!&��u��5�X�v*>b��1��]n���LC3�˓; 1B�,
���ޣK]�3E�T�D�f�7���z���J���>�4"T>�z<��r$o2���Z�k��_&�4J�֒��_�)�Oش�9&'��I^�ؾr����w*M� ����.4bO<�1 x��'�C��~h�T'�L9)�0��4����"
�Ml�r!l�-+��e҇b����ٳ��܄O�(ʕѐ�&�8�:j�&Z�y����ш-Q���h��	���� ��j���O�K�����{ٯ�r�T���?جK�`$A��S�@A�*��.�iW�`�91	=�:�������q�TȤ�U>TA}xЈ�6�y~*fR��ZW�g���|*h��uX~�k��AM�P�4FO����:ЈS���96��?����A#��j�������u��5�>�� �r<�K�W4H�:�C�#�f��G�HЈ�0ʜ���#��42�P͓C���G�z��~QV1>�&w��qد�vo�:�d�O�������
�7�0�������8�[�F,�#
�|!��M��)�e��.~ '���F���C�P��H�O�3�Mhd9���J�x������d�=1N�2(����S7�4h����6)�X-r�n�k�ȡ���C1���B�>�@�B!u(�����͒��Y>C
��P�Q��\y�Fb��s�EM�-�n�oJ@�4jR|E���{�UM-#x�̣���=��>h$R��Rg��[��4��zb��$��B������F�Z>ʤt��4"n��6+��AJ9x�J���:M�	��M��3��ۈ`�{b�?�%f�S�笢��9w ��.��{�^4i�}��neS�~C��Ѐ���&�]:��8~;Orh�f���Ğ�Tt���{b5��<�O�2*pЀ�֔�]BA,BA��Ph$J���2*�v�.���J���R1�����||I�<�R�k�2�o	��Z�*� s�K:h�]uX�l�%U�PF��u�M���J��ET�m��s'�@I¡�j���\���[X��dn�VO(#�������=�*Ƶ��B��3J�U*�!�G�?��x�K*@�ĂL'�0��}��]fu���ҵ��Wb,B+���KC#��{(��*��o����,7[�N���ͧ8~Y�m��=�+��ꫳB��v�����ˮ�A��B�H��D�뎮M"��ޅWB���:���440�<��"nuy���Q�W��\�W�54�B��E���%����N� WMH/�.�Za�_� �`"�2��c�.�ZBGH ��t�s�_���1	�K��C�h_��Ѐ1Q��*�`<�KW�&t�� �H����zؖ��WI�]�]Ɠ�]��V]̽Nۡ���Q	,�,ېטk��.<uJi�f��pXu��C�����t�w|ƾ\�;~#,�CЅ�5Zl����DC����
͇�Z:*�������v�-�`v�]`P���v��I!��W�d�߈�:zi^-���\C=��R���"!���F���������n�% �Sk� ���R�F����Gc}4�uW��ݲ��n_��@8d\�l醑��������V(d�n���~�S�������ڨ�͘�Y\��E�؉����*�����CmeT�d�C-".��/�C��4D\,3�	�E�5c �����X�i�A��)��[���*l�2:@���!���(рd\�3�ó�OXk¨Wͯ�>̹�{K4� 2֌�
3��IqF�*밅,f�M�S!Cwv���]��([��!��0$�`SO*�|���Jm��@E�*�$��Ks5��`QX^�PE�:��v@E�*�ERт�l�+�I-"�D��s��D+�ԙ�!i��R�V �O4�a�+1*JW��MF�݉R2t���l��Q�0���f�{̀*bW�O4p*..���W����4K>�@>��W�L��+��w(ȭ� ��?�v�d��y��5�/�����E�	�
���b��
�U���~��(vM����#�����A�������5�Q�'A�c�U�����O�h ��n�ȾBLs6<��E �2��l�@�4xVϊ㍗_m�q���5[u4]��]|���=���I]�I�Ma0��oZ��Cn3�k�@�+��+H�x<+Xj!
�y(��[���z�y�@D$0i���"f�BEE
�*���,t�#~���U\����5+�#:p�Eխ���~��q�L� ҈�c�֜��^�a�1`ؠ~y�{���}�*��}� �yVp�E�ϧ-	bµ ����B8~Gd�FhD�3"��*1�G<�QK.D��L:�mr:!��WDj4I���5�1i�J�Q\��3j��"d���EX�#��[-�����2"L�q@�#�[�#^�Q/�4BB}��j}��v`1��Ml(�R�]F�4C�#rK"#j�~`F�Ν�пUϲ�ZoE9%��jA>�I7�ֱ'�hfFt�+�J"lg� K+41+�>�����ۡ�+\��yV̋����Rpt�kj���"$&�PRĞ��s����s�J�"��
��h=ա���&Bi�݀&���>B�4��G$l���UdM��̈K���	4a54�W��i��4����>L���YI`��=G#NJ"Fm� �����!\�xhb��e҆�YM� "�[VB�������ͷ�� Oz�;�����a�l�p;}Ѕ��YQ`���O'E����;#Hu�M��y�f�gU���K�Ї�[h�7\���IWT���L�� �:��Uͳ�`n���ѧ���QùSЇu�&mѓ���Ih8�=� 	��T4����ǡ�O $i��EJ��'�����4 eEg	l@F�ATC�In7���
hb�9�1��H�����C���jm@�7$B\�u������s�7���74�~����Ied��=@@��Z�t7�8�dh8S���{��h�<�4m�y�K�@s�M蜠�!~RiU7<�k��au@j����e,4(�j��ٻЇTPw�������z�;�]�9:�iCԤ6R��{K{�n=����w0��Qq���?©� �=n��}I���p�1�����.4au@U�m}�������Ԭ9�o�v7�@��?�h��ǹa�<�6Ї��'���	�.�!����٥��Ѭ;w�58��'m�k�7�^�_���A8}���#�Oû=�*�i������24��Ci��Y{��`�Cs�a�Pܰq��BbC䖱�[��P~�+{�چa�?�-��`CY�0�akCRCD��M�ox�`;���9��Z��^#l��!�!xD��ұ��ۆ�Epox0��PW#�7|�אS#7�a�F��P���F �c*�{��ǁ��!�a�4R\C���#�kH�0�a�HXߐ�au��H�mx�aKC�C���!�!�H4Ȱ��b�k�@z �����p�I��0�^45	��O]��cP"�4x"�1�@l D	�MBhCBL(@���!!Sƫ�\�,lh��g�y��Z�q��*67dU	�-	j��T��]%��!	>���\%�?�J"�w	�HA���Fz�0)k8�%�6,�.K�rܐ_�]Br�����%�5���FW�u	��x�pt	��T�e�ކX��aKC"ӆ�2��!�؆�2��!�mCw�����܆�2Q��eџ�2�������2a\�g��e�Y�W��e�IC߆�2����_CZ����lkCr����K@CB����nw��2A��}Qe�rC����2A�a���2�� r�!`�#q�B����0��s����<�s��?�5��0�j��y(߆�2����wCn�`�Pǽ��L0k�j}CY�0��e�e�mC��Me�ju��e�c���؆�2��!�i�l��ՐF�a�L�ҐH���7@���!��LnǐB�.!�!�m t	q{�_�]Br��[�f������5��J� �]�ۆ�ȭ��5}�o�@���?:Hd�w��"o�#A�U�
$"dsCV�`�Ђ��eU¸��Y���m����!Sƫ�\��6P��iQj�@7	�QaF�Y��Ć!u�e-U�������D�����5	ߺW�.6�6	=��'�!�H@���4d	#Z���n���C�mx�az���HXߐ����Q$�kH	�� �q�m�}�n�:P�`�#�58�nx�#�6��o�x���r��m��s/��������m�����}�n�1t�p�!q�EI��!�!x��7���6<n�m~7�ِ�1��(A����e%¸�A�k�D���6�:����-Bh�XЇĆ�-����C(nظCi�����~�����24�~�|+��B�V}���ꆅ
�������-�Ù��=��z����{���GB]����#�!��@���f������ �۴�熙�>x4T�]l��AD����H �S�A~C�>���v�m����ޒِZ�B��!���c�w��?85@�!��:��Pk�n����p�-j�A�6D�*�0wh�=���fG����
�v7��?�~M(t����*oحg
>��5�WZаdh�}.�k�Z39Fh��?Z���6�<z��0�83FiP�p���‥���Ƅ*.,�[�"�a�3��jC[�M�����o?E\�2xߐ|FkCLm�N��r��oИi4������5�j��>ɬ�� ���LO�4��J��g!m��L���4	��yܝAX����gXM\�.x���\G�;hK�Ν�T54Ws���.40�eAd����ЄecP�P��@'"vЕh�7\<���5�_�����"�VW"t��5�i]�hl���,����LfАx���'�6l��E���/9M�ۂ;���/Y�~Г��6�{�<ʤ�e�h�����'�6 ��5A|�ܯ9
M<�
u��_3-�tВ�
���l�0Ò 0b���Lh�RS�$�*`SD��#� kh�}����"p����6�z����Fu�YBTĻAC��� ��0;�k�-�BC������MH�I{�&��>��2�G8:"L#\"�K�y�P=�����4�������C�B	4a;hGXZ#fe쉨�_\̄�N���� 6"mh��~��&��Fc�SHdDͼ[̀1�)b?p>"whߵ��9����C�VwEt�N�>��%��2�L�I����;!�9»P��ih���H��k��[Z1����mh 7�xl��_��ɥ�&I�֡s�[�o����a9s��e�	�@y�c���;�y�;}��;&<��S]f��A���j��C`|��w�U�>tm}���(�� �1`��+��tH#��)����N�0�Ǿg�@�*FUD�$t�#~ͻe�D\�бc�+�(��	P`7�c|*"���"�1�P2P�nP�)"B��+"�x\��V��ׁY�n�"��D� 
����p�u�}s�"u���,���Tt�"v�j0�B�y4�Q8�Q�VL�תk*���L��3�v��r�
��b��F[\LE]`b�3u����� �@NE�yR�=G0���an��V!
0�CD5f��ڕ�@���������-�A���1Huv�e��=�#��h�������8���A�j��w�#Tqu������2�l]�A��%P�@����3�H>W�!\�?�W�L��P����@:���n�ܨ5�s`|F�$��������0M=R3���\�PE�$�1$���?i��7�=����4�H�
O�d�k�"�Q$-x�t��0���p3����*
'��y�_�+�����,;9D}�wd��^�+��=�!�j���
�4@�q/#-)Ψ��=��1sI@Ӭ�0��r-9���h ��9��lM�dqe����,�#�aC.�з��9�>-��(�/���"�w�v�k� b>��� �,$��9G���)��p�fP֝15���G�P�/v�x8�e�P[���f��L_�EKC� �I���9�����8��/�J8�^�M�0�8$�H��;F��il���� OӍ,�G�C"�^Cd;��7���/���|uC����� �p�dc+d��\���|�;�:;"�% �:�ILs������Q�YMb��%�~�:8���2�(]���>�i��
�eY�x�l�.^L"����5�o��{�o�i�q:�/�z��
]DN]�����y,�:���,I��U�R���E%0M3l��ոT�:��'Ѕ�$�a+��.�Y���hdt�]��ƻ�&t�%F:d�/�1Q��$�a@ǥ���x'��.&a�9�7t�Ѿ$�:���u(���r�r�6�M!L��F2��[)\��z�a���v�xG-�0�֡GUKH9��m�TLI�� �F.CȬK��xWM �.���b^��}�N�D��$��-_�2�4��B�H��DAH�e�l���B�A��b
YH=�����n������p��w�]����F�B�C��!�F���Q����[ld��r0_�6l/ ���l����l���J� W�Q�f63HK�.�^��6���qJ,Tԗ���& )%�4�y�:��X�@o�h�0F��
�	k�n����HX#�������x�Vˬ��5�̹���<��?�
	O7��V !PF-x���!O��h�FW�|I�u(�P�%�7�S�/�C�1�eL��l()��$ʘ�RЈ_�Q�6����u�V(#c����`J��4��;�*���2��{%87�Nh��)T�ˀN��6����󻣥�h���3!��=ˍ�ΐF�錾�)���V��ϳ���e6��J������4�e4qRN��xC�����?�T�^�rGS� �r�$��N�"g{[M4�:��j��k�2:~BJ�9��6�e&��R�m������FT��H�l�@���Z���j�4F�.ohكn2�(M�I�ZJ���S4FL<x���hi��n��;#�[F�,��Z<n�u�ߋ	Đ��2�ST�ɸ÷�h�C�F?�2�q����6#l��F.hÌ5/0o�5��;��#�)��Z��f�.��ǰ�.C�I��;x�{�-�ƈ�6v��	#Zz7���(��m81���B�@������\��nAc�@�0��e!iL�����M����ZF/��ƭbȘ�m��DYm=� ��E_3�l��FAcL4q<]�.*>��wEï��h��pBL��.���H���e��H���7�$������l)q��&]cv׿ffz!�A|���;�$���u��,��$5����@c��C&h���1����W��"/��3��Z�4A��6>���ڠ��۠E�{�	��WÞ�qw�({�o��>�u���u�\݆,BO�f�.��)cW��#�ۈE� �
*7�(�|/���	� ���cs�K�����uf�pd��[\h["��Fg�����r�5.4�/�A���V!g�"W��Aq��@�����{Ő�2�\�6�����x]
��X��ci����\hS���$�e��k�&f]�9�!�a��H���'ԅ�4��у �y�y��~�+���V<�4e䬓X���G�9ah�߆)���w@���~�@ل���6I�P�y��Gc��}��(�aB|���1,uAS$�)JЌM"�j��ư3},��f���fl��7�����X��PX�gl��n��h0!(t��	[L`��a篧H�t�����0���CW�k�4�{��щ�=���;�;��&��mp2L1L����熲�0!X�ocU/`���hm_aB��چ&Z�Nٸ�t���`F��Fb��f�{�=GcXh����%��`���F�=G&��AmӒq~�r���q�	{aF|��6��r�+��M,%�у�MJ6���`o��h.�0#�nc�`Jt��y�w�����Id�F�s�}��)����}#�0�q"�^l���0'�@�|��w�����5�D�!ωm:2K'La��K�6<ih$�6܈`
s$n��h�'�d��3����o��qsb˩�˧"\I0�%2�u����9q���LDE!�a��i�_@g`N���!چ���6�?[�W{G�6���H�m�謡���Ya�&"��쯿ڃ���c���$D�2L�)�o��h�aR09^"��&1v�k�k�H[aV����1��&1D�=�m|�#I���D��#�"ˋ6�1��Deq��?JY6̊N�o��h��f=��|��t~��T=m���,.��\}0+*~�Y;��������d�0+fi����L�4��YY�	s?`V�{p�[?JK�M�~��qN���aZ��n|������<ۊ6���w�0����vmBIѼa�	p��m�;#�š�O��h|�`^����3]-L���#�)�K��a�������0��Ö��I��|�k"N�Í/9&^��x��R�s��̋tv��0<��<j��~�M��y�f�)^�F�����r���f�&��r7�a"�j��馣&F�	;��V���a��O��h�����c�<�u3Z9L��ÿ��c���QDog�ԟf����$چ?	L�Nk_�C;��6̌���/w�9肙qŰ��mn��	3)�}�e�y�̌z��ƫ���S���[������F*���=nVi�����{��i�s�6n{K_be�,�k��pw>����Fý��al�S�#�k�t/��F���;����&���{��C�0P	s����W��:h���|x��\
R&b'����6k�w��=[.���}/���/��(���C�9�mc�6�(����u09��fxѭ0R9L�f+�^�V�I����px�7]I0;2��WUa�j�ɬ;��놶�� L���^S��b��uDv��6ƨ����
�^�6Z.��d��o���Pr�G!�ݟ�~*<{u��0{�%�y�c+��s4����!��ӣ�����	n�0=���}1�+�0?"O�īB��U�~�[٨K ���\���z�g�M�@�>���T8t��xE��mc��1Tw�����g�ra{7{ꝡ�2,��`���2�]X �9<�#
mc�?�@|0����"����'��:<�"����T��k��-{�W�|{p#[�pǸ���Wv�� X?��m�N,����G_���',g)�����+�D�]c�_<�
�&��D4[� =��r�`��If�_<�
��ZX#Ҩ�=o��,X#$�e�_<�
��X#:�}� b��5B�<���QWX����]:o�}�H���_<�
c�w�H��=>9��� ,�����_Y�V�G�����0ŰJ􉠳_<�
�2/�9^l�z+�1���2�F"����V��|�e"�����2��,r&����ZQ�K#,]����ۘ�։"0�@���NX'���!�d Zn�BQ�w�x�	a��ux���V��R��A��9Vs�!���?��GƛT�]�`3(��A�oO��{X)��tT���d��Tp�:�x|]��`�	!�?"����S�Z��(Onc�tbX*��o��'֊~�&����V�_%�����yK���a�(�K�yM���^X,.Q�?�� A�E��Gţ����KX-ޛ~t �����\<�A��&�QX���E��8����|_���_�1Gϧ�f�2X.d.�8z��X��~X/��EGOf�"7�z�����������!s�:��2��b�pM�`4s��?�on v*a��t�,�É�1C�VOa�J��~w6?�`��ጉ�É1C��|RX2��Uﯠ�AX3j�0GO`�����������@�\%�E���'��|K��E������²�F0Kt�믞!��5=�j����z��b�`ݨf�ϝ@ǡ�]�AX6�bi���m8����Q'���ۢ1�Fyİpd1=�^�@邕�]jgz�G0&:�59��V/��*T?,R����e�ЉP��-�v��pX���p�D�x48o)Etf׍�0�K����a���[0p�V�G����Kv�S���U?`����h��݄D�ۙcε�_���%���D�M���;.��AW��y3��]�\98�1\����z��v��f�me��N�vo��X*�sb�F4ڌX�낅42�Jtȱ�d\t�7EgC�Z�ސ�U��&���}��G
׉�����!�ڗ�ӡ��^�4���;���L%�����6�
�"W�~�`���ʋ=2���9��{�P��X�ո�Ŵ�w?}<�m�n�Z�[�}X����������̰��OA_���vI��.�0���/mS׌����9�k���������R׌G��o����\7D>����[�y@i��'�y�~�ucP���wP`�W ��]j�Y����B��J{���Wb�v��y��-L���/�@��Y�+��h!+J�æϖ�=bdx�� ��!8�~5�}D�O�%��������Y�0�L���#dx��n#�9�~.g/�~B��g%�\� ��e����ʿ ���6��l�_�s��*�`�'z�2A���@��N7"�Z�����qC�dW$:/A�3"�;)T�Ӣ�9�%I�.�}%^z������w;)��~=�5���{�ә�i+�?\Z�2<}�_�͙���\)��D�[)�z�H������@��j���p���L�Y�.�s��	&�l���9�}~���n֩�_��Tu?=^�r��?��S���s�A�s3?�	6{��hw�̙��T x���j1��+�jbw�'<7�Ú���'4A��Щ��5a�PU��Y\)�������C��5kO���&���9��෫�O���&{����IS�N��� �K�L��'�ܳ�>:9� En�0o�&9����x�bM\�r�d�9;�� 	�۾*�^c��N��w��x���Q�_먣og����������������܅�A���M|v�]t~�W:�pL�W��?�2����jߏu���b�$�N�Ȱ�
_����B�����;_��3��G蛙_�.D�b�e��߳��9��8�/���w!j앮���R�W���}?�]���6��P�d�V��V2�|���MU�m㡦��Zo�9dSl����߅S�9&�K�G�\q,2
%���)�j2G��dף�G���f!c�����o����t����X�Z�R��l	*��?�/�:�L�Yc����w�!��{Ҝ�������B������6���$���λ.�K�Zt�h��R�]�� ٱ65���)���L�1kS̶�:n<m��f����q�Q��g� [���͝��a<3�4(`�6/���  [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dr8xpq2l8qjg3"
path="res://.godot/imported/player.PNG-b3a6a3ed61d5cb4dae78911a5ab50237.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/player.PNG"
dest_files=["res://.godot/imported/player.PNG-b3a6a3ed61d5cb4dae78911a5ab50237.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
�����dGST2   �  �      ����               ��        �  RIFF�  WEBPVP8L�  /�C*�(jۈQǳ��d��	 2�V���bܦ�E�_m�H1ػ�ADL@���B��V4���UX�˖PڂI�"�O�Ϭi���A���7m��k�K6#����\�KIC&����{�S����o{�ݞz����Zg��<�%J�\�͍����.h�W�$UQ��o������J׶�m�'�03ϊyf���g�vɻaff�\SI)��Dv-�r,���#�X�$J�[�n�R�%�K���_�R`�XLA�4���|>\
?�������D���v�.��f�٭8;�miRo�p���(o#k=� �b�,���ʙ�#3mi&_�Kŏ�)�$���v���i4]}�[�-ŏ'S(�8���4�������m�A�J�T>N��jt�SS�v��T��u��p��h:�Tm���KS�]�#� ����p��SϺ�6-�	���
��~~�
X�]a���ڞ��: J��� \\Mu5�2��<��i X����ps�*,!�7���>F�U�Q�:���Z=bku��7��z�t�p�?\2����Q�����Eψ����"��A-I�f�E����!`� ���̪H�&�!����t]�2PG�=Aͧ{u�����N��s�� ���ӽ�X�������$<
�����}?��r��?��@��td�A2����$�����	�
Y�$K��B߂*��GW^v%i���b��'��ɡK$��J����b$r[}��З!n���g�""�A�r�aX&Z"Tи�ɴ��a�%V	��4#.}�3�"�@�%�t�C+�d2ౢ#�����{����bm�ZT@��-s��1��f��-5o�Q���a�Y�Q�b�xF��C�`��z�I�u��R�ug^Q��s���U�5��m��
���HP�iNw��AkΔ8'D�G�LI�(�	f�\��i3��5��|�a9��ܔHh��4H<�(��H�r�UW,0Cԝxx�JV��c��ŭ��g`Bǃ�9������q�L�"�[�-W�F~���������z�P�i�,x��P>2�L����ׂ&̱�ks�~ek���K�kh�ІC!UGid|�?�&14@]ԣ�zee�l*ժ���5L��,���U�H�Ai��N~*� [B�qD+����o0�Tl��5m*���g�[�Go�J�Y��;A�a���v�Ά@�W�e&�Գ�p�o�"�T��1���q��܉�Xt![U��
����z%��T�9�NW5dф�p5��k47��+a�	I�5��o�Ӝ]�'�~aZ�7e'd'��k�]I�=�	�:W�WS�T����r�k�.��>q�t�i_������U�4��-��*L�Fl2��q�����X�D2�13����L��:m��b[������m>���8k\��S����f]��� (���&���C,�6���DG�po���dS ��KP~�W@��/��\<S=<%Ff���]O@�s����d%�?��r^]���׍D��9E�,'G�ҷ�����22�2���$�(o�x��X�SxG!H�2�L�{O�O��"�-�"y�U�� ��%��sSYI\ =FƗ�R�pxb�ڥ<K�ыSh)����o�-"Q�$�V���Q�t9y�������.u�fX���|s(U^Bd�sO���~��X�u`�s	eK�[lq�	����0(
�@��~��I�U"R��fW:~C��<�B�"��o@��A�2�LK��f$VXG��o8U*I��W����|�.����ԏ����J���zbS/��T;CQS�i`�iS=�*o��iGd)x�LQ�t%b2��v���S�&4鍗�XV�D;5�|FX,�n��fOF^n�	�(�����8��R�o6�nI�~*����T�v�JI�V(YI��p�����&6��ꪫ���v�J�����a�4Z�����⪫��vK}JJV�̳S �� �a��aLГ�\�d�9����#��#���h)���1:�(��6k�BwSrЄ9nnS��rl��P��E��fQDD'�Mq
1��Q�J߲nOc9*"��:%j��u��s���_�T�7}]a!�n�S|��0
e�oG���:S̸	n�S$����ce����>_�֋z��l�~e܈���gNJB�����g8�r�iu ��;�A�o#�an-P�t�
��17�,U�#��X1ϒpM8e}����v�TU�U�y�C�	��@O����2O̰C��hyp6:m�c'B �s���#�1�q�q�e�n3'6 �V5E�/�1B�u�@����V-�1�O��F�e���ˆ����Q+̴OB#��@l�=f4=�ꂹi�hw@�nv����������6j��r�q���1�g��e{���3��w�����4��ǫ��x�K�����OW�d���4����l�^K�:������l�]G���A��\�Rsg�Ol���f/uY� �ݽ'�S;��{�z���=��Mew���}�����z�p�ѓ�2.TA��η��rY��]`.�38U���߰�ܖc�xp69m3�!�Tm��g�jƌ(��c$�����x�>A)(����c5�����!�p�:�AP����G�����:i�Ɲ������d>Z��(���p���=`�?�������C6a�����<��V����}�of۱ <<6�o%�A�K���8t�)!a����ρ�q`�p&��5���`;*"�j�s j��Q�k\�p��/�""�h�����0绩Y�n��PrȄ�V!BMq���p`8n�� @-`08N�����̑�	pq��\ c@�q��BH:����r8V���P���0TL�2%��2'��d%L* 1�a$ho�1�����	-~�Ch�0hfL�gBP:o�@R����N��4��IGA���E$�,�>�mi��2	��&������ |FY,c0%$�B��/e��bĥSS�c��4"	�b^���9=<i�8^�����a�"S
&F�:��� ��/�I	�����@f�Zq�I�
����6�� �n���#��C���p������0\K�T���3- ��0C,�}^/�-�(.K�D���l��]�@��~��`m�z8�?\��TȦ�P���?��Zp|f���J������(��M��C�pt��"��n%$�=aX��YN�l�[и^� ��eedde�`U��M�V����eV�K�C�(��k�F �2��(db���� ����({��"��=	  H��"�	e��f!��rx
��*jf���(Y�C��|T^�i�8����lPB*Zv	�[� �����!T�a,P]8[��@80�#�3��]��D�b�Ht���te�q�
A��N��-u}OoR� � ��AA5�Ȧc@2a�Mx�����.���{�/*&Vš�qи��6lqt�a���S�jj�ſ&-0��? F@�F��:3.���#.�n�,�8�VW�\A�#����Z�4As��m��q�N��l�E��.�yh��cS�00T�Z�8+lG{����mU��@�h�������C�~�\�������J���B4aAF؁����X�b�ď�=ݿ�	c��W�� ��/��GCT�l{'^h�1��ؠ;�~��T=��6$�a��hI_���� ��v�ܮ�^�#[��Q4͔Uuڰ?\��� K��)���B��ÞP�`�l���D^�c5
�C�0��9��g�Sɾ��`Н�`�]���ͱ�(6���)hq�uf~��Gy�:�dO&�n�X0���4��-��d����a_��B聫���/
ۇ�3e�x��@�LI�
^8�ݙ5נx
�i�.gXB�H��~�B�8̚2)�z��V(��Ul6�Yc���@�	�@��	��u�X�IR�m�;�q6����W�òr��<L�-��C�� ��"�Ѝ1�(�|�a�Ǜ�$�[� �b&t>�Z�:���D2��z���ߠi��b�a���$I ��ڧ� x0Rw��2�n�����I=����<�`��%	��I#�?���B��CJ�)D�hJyrA#��DkP�}�P�z����I�Yp�eI$Y�*�ѥ 8�;чʲ�-V�J�B�WVVZJZZ�fR�����d(�}'�@���I�O'�
{>y%��}A��IKI���Ld�����ƾ�t�����~�qo�C	ч�|�. Q��qއV��� ��{�� �Iψ�E0�~�H�P��^m: ��|M��t\r�RSSUߟ�t����
 /-5-�a�3�Փ��L`���� XjjZf��J��j��H�- �=AwIaA��U�F� !S���.�U�xh��"�u\��p�P��
��e�CM62� 0��/�:��_XBQ�O>ճj��U�������M ᡐ)ٙ���h��G4]�H���0ܧ3�)��X%�){�.1Z�߭-��MMu�(���!K\��W�5���iӊ��maR��O��EX2[)�[�f,A����0'X��h�#��?yp�l6��nűؑ8mh����7,B�4�Bx�,�b�X?@�h�'��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b7tp5dekt0c4r"
path="res://.godot/imported/projectile.PNG-ca87f1beb99b126975dc794f50d4b464.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/projectile.PNG"
dest_files=["res://.godot/imported/projectile.PNG-ca87f1beb99b126975dc794f50d4b464.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
���H�l���extends Node

var is_server = true
var server_ip = "localhost"
var player_color = Color.GHOST_WHITE
>��?|�(��GST2   �   �      ����               � �        &  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�4mb�h3O���$E�s����A*DV�:#�)��)�X/�x�>@\�0|�q��m֋�d�0ψ�t�!&����P2Z�z��QF+9ʿ�d0��VɬF�F� ���A�����j4BUHp�AI�r��ِ���27ݵ<�=g��9�1�e"e�{�(�(m�`Ec\]�%��nkFC��d���7<�
V�Lĩ>���Qo�<`�M�$x���jD�BfY3�37�W��%�ݠ�5�Au����WpeU+.v�mj��%' ��ħp�6S�� q��M�׌F�n��w�$$�VI��o�l��m)��Du!SZ��V@9ד]��b=�P3�D��bSU�9�B���zQmY�M~�M<��Er�8��F)�?@`�:7�=��1I]�������3�٭!'��Jn�GS���0&��;�bE�
�
5[I��=i�/��%�̘@�YYL���J�kKvX���S���	�ڊW_�溶�R���S��I��`��?֩�Z�T^]1��VsU#f���i��1�Ivh!9+�VZ�Mr�טP�~|"/���IK
g`��MK�����|CҴ�ZQs���fvƄ0e�NN�F-���FNG)��W�2�JN	��������ܕ����2
�~�y#cB���1�YϮ�h�9����m������v��`g����]1�)�F�^^]Rץ�f��Tk� s�SP�7L�_Y�x�ŤiC�X]��r�>e:	{Sm�ĒT��ubN����k�Yb�;��Eߝ�m�Us�q��1�(\�����Ӈ�b(�7�"�Yme�WY!-)�L���L�6ie��@�Z3D\?��\W�c"e���4��AǘH���L�`L�M��G$𩫅�W���FY�gL$NI�'������I]�r��ܜ��`W<ߛe6ߛ�I>v���W�!a��������M3���IV��]�yhBҴFlr�!8Մ�^Ҷ�㒸5����I#�I�ڦ���P2R���(�r�a߰z����G~����w�=C�2������C��{�hWl%��и���O������;0*��`��U��R��vw�� (7�T#�Ƨ�o7�
�xk͍\dq3a��	x p�ȥ�3>Wc�� �	��7�kI��9F}�ID
�B���
��v<�vjQ�:a�J�5L&�F�{l��Rh����I��F�鳁P�Nc�w:17��f}u}�Κu@��`� @�������8@`�
�1 ��j#`[�)�8`���vh�p� P���׷�>����"@<�����sv� ����"�Q@,�A��P8��dp{�B��r��X��3��n$�^ ��������^B9��n����0T�m�2�ka9!�2!���]
?p ZA$\S��~B�O ��;��-|��
{�V��:���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���(�#2:E(*�H���{��>��&!��$| �~�+\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j����	P:�~�G0 �J��$�M���@�Q��Yz��i��~q�1?�c��Bߝϟ�n�*������8j������p���ox���"w���r�yvz U\F8��<E��xz�i���qi����ȴ�ݷ-r`\�6����Y��q^�Lx�9���#���m����-F�F.-�a�;6��lE�Q��)�P�x�:-�_E�4~v��Z�����䷳�:�n��,㛵��m�=wz�Ξ;2-��[k~v��Ӹ_G�%*�i� ����{�%;����m��g�ez.3���{�����Kv���s �fZ!:� 4W��޵D��U��
(t}�]5�ݫ߉�~|z��أ�#%���ѝ܏x�D4�4^_�1�g���<��!����t�oV�lm�s(EK͕��K�����n���Ӌ���&�̝M�&rs�0��q��Z��GUo�]'G�X�E����;����=Ɲ�f��_0�ߝfw�!E����A[;���ڕ�^�W"���s5֚?�=�+9@��j������b���VZ^�ltp��f+����Z�6��j�`�L��Za�I��N�0W���Z����:g��WWjs�#�Y��"�k5m�_���sh\���F%p䬵�6������\h2lNs�V��#�t�� }�K���Kvzs�>9>�l�+�>��^�n����~Ěg���e~%�w6ɓ������y��h�DC���b�KG-�d��__'0�{�7����&��yFD�2j~�����ټ�_��0�#��y�9��P�?���������f�fj6͙��r�V�K�{[ͮ�;4)O/��az{�<><__����G����[�0���v��G?e��������:���١I���z�M�Wۋ�x���������u�/��]1=��s��E&�q�l�-P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸z��f��i���_�j�S-|��w�J�<LծT��-9�����I�®�6 *3��y�[�.Ԗ�K��J���<�ݿ��-t�J���E�63���1R��}Ғbꨝט�l?�#���ӴQ��.�S���U
v�&�3�&O���0�9-�O�kK��V_gn��k��U_k˂�4�9�v�I�:;�w&��Q�ҍ�
��fG��B��-����ÇpNk�sZM�s���*��g8��-���V`b����H���
3cU'0hR
�w�XŁ�K݊�MV]�} o�w�tJJ���$꜁x$��l$>�F�EF�޺�G�j�#�G�t�bjj�F�б��q:�`O�4�y�8`Av<�x`��&I[��'A�˚�5��KAn��jx ��=Kn@��t����)�9��=�ݷ�tI��d\�M�j�B�${��G����VX�V6��f�#��V�wk ��W�8�	����lCDZ���ϖ@���X��x�W�Utq�ii�D($�X��Z'8Ay@�s�<�x͡�PU"rB�Q�_�Q6  ��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bcqj3agkhy457"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.svg"
dest_files=["res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=false
editor/convert_colors_with_editor_theme=false
�O��[remap]

path="res://.godot/exported/133200997/export-3c5491bc1cb430bead51b94ed5d36eda-game.scn"
P�Q�vы�1����+
[remap]

path="res://.godot/exported/133200997/export-d9f76d5a970f0c7d748d9d68b2f47ee7-lobby.scn"
�4����u�U�*�*[remap]

path="res://.godot/exported/133200997/export-e8447e6724d1bd2b40f00fb2ff1f13fd-obstacle.scn"
�s������ [remap]

path="res://.godot/exported/133200997/export-8ea4c9fcd0fdba806e37b6be6983ddf2-projectile.scn"
�㨻�h-(�[remap]

path="res://.godot/exported/133200997/export-42beae71e6dd8be1222da04ec3fae74d-player.scn"
�}����2��9�+[remap]

path="res://.godot/exported/133200997/export-a8ffa8455ee75708b6c34cd8d7888dc7-test.scn"
��݁g�PlN�"��8"<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
P�   ��� y   res://game/game.tscnV�'?(�Z#   res://lobby/lobby.tscn�{�aP�z   res://objects/obstacle.tscn����M�%   res://objects/projectile.tscnyUcrr}ui   res://players/player.tscn7uoO��-   res://scenes/test.tscnyg�-��iH   res://sprites/aimer.PNG('~���TN   res://sprites/obstacle.PNG<�~�t   res://sprites/player.PNG+�gz���@   res://sprites/projectile.PNG Mi��t�#   res://icon.svg8��Eu�!   res://players/test.tscnECFG      application/config/name         TopdownShooter     application/run/main_scene          res://lobby/lobby.tscn     application/config/features(   "         4.0    GL Compatibility       application/config/icon         res://icon.svg     autoload/Globals         *res://globals.gd   #   rendering/renderer/rendering_method         gl_compatibility2   rendering/environment/defaults/default_clear_color      ���=���=q�>  �?�H��ؾ`