package com.rpgGame.coreData.clientConfig
{
	import flash.net.registerClassAlias;
	import org.client.mainCore.ds.HashMap;
	/**
	 * 
	 *  鏍规嵁妯″潡config 鏂囦欢璁剧疆鑷ª鍔ㄧ敓鎴愮殑浠ｇ爜
	 *	
	 * 銆**涓嶅彲鎵嬪姩淇®鏀规­ょ被**銆戯紝
	 *	
	 * 銆愪换浣曚慨鏀归兘灏嗚¢«鐢熸垚宸ュ叿瑕嗙洊锛屽¦傞渶淇®鏀硅¯风洿鎺ヤ慨鏀瑰叿浣撶殑config鏂囦欢銆
	 * @author NEIL
	 */
	public class ConfigClassRegister
	{
		private static var _classMap:HashMap = new HashMap();
		/**  鍚嶇О澶囨敞	璧勬簮璺¯寰#璧勬簮璺¯寰	鍔ㄧ敾鍚嶇О#鍔ㄧ敾鍚嶇О	纰版挒闅愯棌鑺傜偣#纰版挒闅愯棌鑺傜偣锛岀敤;鍒嗗壊澶氫釜鑺傜偣	娑堟暎鏃堕棿#娑堟暎鏃堕棿	鍓嶈酱鍥寸粫鍗婂緞#鍓嶈酱鍥寸粫鍗婂緞	鍓嶈酱鍥寸粫瑙掗€熷害#鍓嶈酱鍥寸粫瑙掗€熷害锛堝害/绉掞級	鏀舵暃娆℃暟#鏀舵暃娆℃暟	鍥寸粫鍗婂緞#鍥寸粫鍗婂緞	鍥寸粫瑙掗€熷害#鍥寸粫瑙掗€熷害锛堝害/绉掞級 */
		public static const EffectAnimation:String = "data.animat.EffectAnimation";
		/**  瀹㈡埛绔¯鍖哄煙鏁版嵁			 */
		public static const ClientArea:String = "data.ClientArea";
		/**  瀹㈡埛绔¯鑷ª瀹氫箟buff				 */
		public static const ClientBuff:String = "data.ClientBuff";
		/**  瀹㈡埛绔¯瀵硅瘽鏁版嵁									 */
		public static const ClientDialog:String = "data.ClientDialog";
		/**  瀹㈡埛绔¯鐨勫満鏅¯																																																		 */
		public static const ClientScene:String = "data.ClientScene";
		/**  瀹㈡埛绔¯鍦ㄥ満鏅¯涓­鐨勭壒鏁						 */
		public static const ClientSceneEffect:String = "data.ClientSceneEffect";
		/**  瀹㈡埛绔¯鍦ㄥ満鏅¯涓­鐨凬PC									 */
		public static const ClientSceneNPC:String = "data.ClientSceneNPC";
		/**  瀹㈡埛绔¯鍦ㄥ満鏅¯涓­鐨勭壒鏁						 */
		public static const ClientSceneRole:String = "data.ClientSceneRole";
		/**  瀹㈡埛绔¯瑙﹀彂鏁版嵁															 */
		public static const ClientTrigger:String = "data.ClientTrigger";
		/**  瀹㈡埛绔¯琛ㄦ儏閰嶇疆					 */
		public static const FaceInfo:String = "data.FaceInfo";
		/**  娓告垙闊充箰閰嶇疆琛¨							 */
		public static const GameSoundInfo:String = "data.GameSoundInfo";
		/**  璁剧疆鐨勪富閿®#璁剧疆鐨勪富閿®锛屼笉閲嶅¤嶅氨琛	璁剧疆澶囨敞#璁剧疆澶囨敞	鐜荤拑鏁堟灉棰滆壊#鐜荤拑鏁堟灉棰滆壊	鎽勫儚鏈篩鍋忕Щ#鎽勫儚鏈篩鍋忕Щ	鎽勫儚鏈鸿浆瑙#鎽勫儚鏈鸿浆瑙	鎽勫儚鏈轰话瑙#鎽勫儚鏈轰话瑙	鎽勫儚鏈烘渶灏忎话瑙#鎽勫儚鏈烘渶灏忎话瑙	鎽勫儚鏈烘渶澶т话瑙#鎽勫儚鏈烘渶澶т话瑙	鎽勫儚鏈鸿窛绂»#鎽勫儚鏈鸿窛绂»	鎽勫儚鏈烘嫋鎷介€熷害#鎽勫儚鏈洪紶鏍囨嫋鎷介€熷害	鎽勫儚鏈烘渶灏忚窛绂»#鎽勫儚鏈烘渶灏忚窛绂»	鎽勫儚鏈烘渶澶ц窛绂»#鎽勫儚鏈烘渶澶ц窛绂»	鎽勫儚鏈烘粴杞®閫熷害#鎽勫儚鏈洪紶鏍囨粴杞®閫熷害	鎽勫儚鏈鸿繙瑁佸垏#鎽勫儚鏈鸿繙瑁佸垏	鏅鸿兘鎽勫儚鏈烘渶灏忚窛绂»#鏅鸿兘鎽勫儚鏈烘渶灏忚窛绂»	璺宠穬楂樺害#璺宠穬楂樺害	浜岀骇璺宠穬楂樺害#浜岀骇璺宠穬楂樺害	璺宠穬閫熺巼#璺宠穬閫熺巼	浜岀骇璺宠穬閫熺巼#浜岀骇璺宠穬閫熺巼	璺宠穬缁撴潫鏃堕棿#璺宠穬缁撴潫鏃堕棿	浜岀骇璺宠穬缁撴潫鏃堕棿#浜岀骇璺宠穬缁撴潫鏃堕棿	璺宠穬鎵撴柇鏃堕棿#璺宠穬鎵撴柇鏃堕棿	浜岀骇璺宠穬鎵撴柇鏃堕棿#浜岀骇璺宠穬鎵撴柇鏃堕棿	浜岀骇璺宠穬姒傜巼#浜岀骇璺宠穬姒傜巼锛0~100锛	璺宠穬寮€濮嬫椂闂´#璺宠穬寮€濮嬫椂闂´	浜岀骇璺宠穬寮€濮嬫椂闂´#浜岀骇璺宠穬寮€濮嬫椂闂´	姝讳骸鏁堟灉绫诲瀷#姝讳骸鏁堟灉绫诲瀷	澶栧彂鍏夊己搴¦#澶栧彂鍏夊己搴¦	澶栧彂鍏夊ぇ灏#澶栧彂鍏夊ぇ灏	澶栧彂鍏夊搧璐¨#澶栧彂鍏夊搧璐¨	澶栧彂鍏夋晫鏂归¢滆壊#澶栧彂鍏夋晫鏂归¢滆壊	澶栧彂鍏夊弸鏂归¢滆壊#澶栧彂鍏夊弸鏂归¢滆壊	澶栧彂鍏変腑绔嬫柟棰滆壊#澶栧彂鍏変腑绔嬫柟棰滆壊	鍗婅韩鍍忓亸绉»#鍗婅韩鍍忓亸绉»	澶村儚鍋忕Щ#澶村儚鍋忕Щ	Boss澶村儚鍋忕Щ#Boss澶村儚鍋忕Щ */
		public static const GlobalSetting:String = "data.GlobalSetting";
		/**  GM鍛戒护							 */
		public static const GmInfo:String = "data.GmInfo";
		/**  骞挎挱锛屾彁绀鸿¯­				 */
		public static const HintInfo:String = "data.HintInfo";
		/**  姣忎竴绉嶆彁绀虹被鍨嬬殑閰嶇疆				瀹藉害	楂樺害	鏈€澶у®藉害	椤圭洰瀹藉害	浣嶇疆X	浣嶇疆Y																				 */
		public static const HintTypeSetInfo:String = "data.HintTypeSetInfo";
		/**  鍖哄煙鏁版嵁搴					 */
		public static const Q_area:String = "data.map.Q_area";
		/**  							鏈¬鍒楀彇娑堬紝瀹夊叏鍖烘敼涓哄埛鏍兼柟寮						鏈¬鍒楀彇娑																																										 */
		public static const Q_map:String = "data.map.Q_map";
		/**  鍦板浘浼犻€佺偣鏁版嵁搴											 */
		public static const Q_map_transfer:String = "data.map.Q_map_transfer";
		/**  鍦烘櫙闊虫晥閰嶇疆淇℃伅					 */
		public static const SceneSoundInfo:String = "data.map.SceneSoundInfo";
		/**  鍦烘櫙瑙﹀彂鍣ㄩ厤缃®琛¨								 */
		public static const SceneTriggerInfo:String = "data.map.SceneTriggerInfo";
		/**  鎹㈣£呰。鏈嶇壒鏁堣祫婧愰厤缃®							 */
		public static const AvatarClothesEffectRes:String = "data.model.AvatarClothesEffectRes";
		/**  琛ｆ湇鎹㈡ā鍨						 */
		public static const AvatarClothesRes:String = "data.model.AvatarClothesRes";
		/**  鍓¯姝﹀櫒璧勬簮							 */
		public static const AvatarDeputyWeaponRes:String = "data.model.AvatarDeputyWeaponRes";
		/**  澶村彂璧勬簮		 */
		public static const AvatarHairRes:String = "data.model.AvatarHairRes";
		/**  鎹㈣£呭潗楠戣祫婧愰厤缃甀D		 */
		public static const AvatarMountRes:String = "data.model.AvatarMountRes";
		/**  鎹㈣£呮­﹀櫒鐗规晥璧勬簮閰嶇疆				 */
		public static const AvatarWeaponEffectRes:String = "data.model.AvatarWeaponEffectRes";
		/**  涓绘­﹀櫒璧勬簮							 */
		public static const AvatarWeaponRes:String = "data.model.AvatarWeaponRes";
		/**  鎹㈣£呭ご鍙戣祫婧愰厤缃甀D		 */
		public static const BaZhenTuRes:String = "data.model.BaZhenTuRes";
		/**  鍙樿韩ID						 */
		public static const ChangeModel:String = "data.model.ChangeModel";
		/**  瑙掕壊楠ㄩª¼						 */
		public static const HeroModel:String = "data.model.HeroModel";
		/**  鍧愰獞妯″瀷琛¨	鍔熻兘鍚嶇О	鍔ㄧ敾璧勬簮鍚嶇О */
		public static const MountModel:String = "data.model.MountModel";
		/**  鎬ª鐗╁垪琛¨																																																															 */
		public static const Q_monster:String = "data.monster.Q_monster";
		/**  NPC閰嶇疆鏁版嵁搴																																																 */
		public static const Q_npc:String = "data.monster.Q_npc";
		/**  瀹氱偣鍒锋€ª鏁版嵁搴 -- 缂栬緫鍣ㄥ綍鍏¥									 */
		public static const Q_scene_monster:String = "data.monster.Q_scene_monster";
		/**  鍖哄煙鍒锋€ª鏁版嵁搴 -- 缂栬緫鍣ㄥ綍鍏¥											 */
		public static const Q_scene_monster_area:String = "data.monster.Q_scene_monster_area";
		/**  姣忎釜鑱屼笟涓€绾у睘鎬ф崲绠椾簩绾у睘鎬ц〃		 */
		public static const Q_att_transfer:String = "data.Q_att_transfer";
		/**  鎵€鏈夊睘鎬х浉鍏崇殑鏁版嵁																														 */
		public static const Q_att_values:String = "data.Q_att_values";
		/**  澶嶆椿鐣岄潰閰嶇疆琛¨				 */
		public static const Q_die:String = "data.Q_die";
		/**  寮哄寲閰嶇疆琛¨						 */
		public static const Q_equip_strength:String = "data.Q_equip_strength";
		/**  鎴橀瓊鍗囩骇鏁版嵁						 */
		public static const Q_fightsoul:String = "data.Q_fightsoul";
		/**  鎴橀瓊妯″瀷鏁版嵁		 */
		public static const Q_fightsoul_mode:String = "data.Q_fightsoul_mode";
		/**  鎴橀瓊鍗囩骇鏁版嵁			 */
		public static const Q_fightsoul_path:String = "data.Q_fightsoul_path";
		/**  鍏ㄥ眬鍙橀噺琛¨		 */
		public static const Q_global:String = "data.Q_global";
		/**  鐗╁搧鍩烘湰淇℃伅鏁版嵁搴																																																																																			 */
		public static const Q_item:String = "data.Q_item";
		/**  閫氱煡鍒楄〃			 */
		public static const Q_notify:String = "data.Q_notify";
		/**  闃佃惀鍏崇郴				 */
		public static const Q_relation:String = "data.Q_relation";
		/**  tipsid	鏍囬¢	鎻忚堪 */
		public static const Q_tipsinfo:String = "data.Q_tipsinfo";
		/**  绐楀彛閾炬帴				 */
		public static const Q_windowInfo:String = "data.Q_windowInfo";
		/**  鑱屼笟瀵瑰簲鐨勫悕瀛		 */
		public static const RaceNameInfo:String = "data.RaceNameInfo";
		/**  璧涢┈妯″瀷绛夐厤缃®淇℃伅								 */
		public static const RacingInfo:String = "data.RacingInfo";
		/**  璧涢┈绛旈¢橀獙璇侀厤缃®淇℃伅						 */
		public static const RacingQuestion:String = "data.RacingQuestion";
		/**  鎹㈣£呰祫婧愰厤缃®											 */
		public static const AvatarResConfig:String = "data.res.AvatarResConfig";
		/**  鍦ㄥ満鏅¯涓­宸￠€荤殑NPC锛岃§掕壊锛屾€ª鐗╃瓑锛屼俊鎭¯閰嶇疆	鍦ㄥ満鏅¯涓­宸￠€荤殑NPC锛岃§掕壊锛屾€ª鐗╃瓑锛屼俊鎭¯閰嶇疆									 */
		public static const SceneCharPatrolInfo:String = "data.SceneCharPatrolInfo";
		/**  socket杩斿洖閿欒¯¯鐮佹彁绀º			 */
		public static const SocketErrorNoteInfo:String = "data.SocketErrorNoteInfo";
		/**  瀵硅薄缁戝畾鍣¨,缁戝畾鍣ㄥ彲缁戝畾鍦ㄧ帺瀹讹紝鎬ª鐗╋紝鍦伴潰鐗规晥绛夛紝鐢ㄦ潵鍔犲己鏁堟灉鍜屽¢炲己鍔熻兘锛屽疄鐜板姛鑳界殑缁勫悎									 */
		public static const Attach:String = "data.spell.Attach";
		/**  鍦伴潰鐗规晥			 */
		public static const Attach_effect:String = "data.spell.Attach_effect";
		/**  BUFF鏁堟灉閰嶇疆鏁版嵁琛¨																																								 */
		public static const Q_buff:String = "data.spell.Q_buff";
		/**  鍏¬鍏盋D琛¨	 */
		public static const Q_GCD:String = "data.spell.Q_GCD";
		/**  鎶€鑳芥棤瑙嗛槻寰′激瀹虫暟鎹®搴																		 */
		public static const Q_skill_ignore:String = "data.spell.Q_skill_ignore";
		/**  鎶€鑳藉熀鏈¬淇℃伅閰嶇疆鏁版嵁琛¨																																																																																																																																 */
		public static const Q_skill_model:String = "data.spell.Q_skill_model";
		/**  鎶€鑳芥晥鏋滈厤缃®琛¨																			 */
		public static const Q_SpellAnimation:String = "data.spell.Q_SpellAnimation";
		/**  鍗曚釜鎶€鑳芥晥鏋滅殑鏁版嵁閰嶇疆																								 */
		public static const Q_SpellEffect:String = "data.spell.Q_SpellEffect";
		/**  鍙¬鍞ょ墿琛¨												 */
		public static const Q_summon:String = "data.spell.Q_summon";
		/**  灞炴€х殑鍚嶅瓧锛堥拡瀵逛笉鍚岀殑鍦版柟鍙¯浠ユ湁涓嶅悓鐨勯厤缃®锛	 */
		public static const SpriteStatNameInfo:String = "data.SpriteStatNameInfo";
		
		public static function setup():void
		{
			regClass("data.animat.EffectAnimation", com.rpgGame.coreData.clientConfig.EffectAnimation);
			regClass("data.ClientArea", com.rpgGame.coreData.clientConfig.ClientArea);
			regClass("data.ClientBuff", com.rpgGame.coreData.clientConfig.ClientBuff);
			regClass("data.ClientDialog", com.rpgGame.coreData.clientConfig.ClientDialog);
			regClass("data.ClientScene", com.rpgGame.coreData.clientConfig.ClientScene);
			regClass("data.ClientSceneEffect", com.rpgGame.coreData.clientConfig.ClientSceneEffect);
			regClass("data.ClientSceneNPC", com.rpgGame.coreData.clientConfig.ClientSceneNPC);
			regClass("data.ClientSceneRole", com.rpgGame.coreData.clientConfig.ClientSceneRole);
			regClass("data.ClientTrigger", com.rpgGame.coreData.clientConfig.ClientTrigger);
			regClass("data.FaceInfo", com.rpgGame.coreData.clientConfig.FaceInfo);
			regClass("data.GameSoundInfo", com.rpgGame.coreData.clientConfig.GameSoundInfo);
			regClass("data.GlobalSetting", com.rpgGame.coreData.clientConfig.GlobalSetting);
			regClass("data.GmInfo", com.rpgGame.coreData.clientConfig.GmInfo);
			regClass("data.HintInfo", com.rpgGame.coreData.clientConfig.HintInfo);
			regClass("data.HintTypeSetInfo", com.rpgGame.coreData.clientConfig.HintTypeSetInfo);
			regClass("data.map.Q_area", com.rpgGame.coreData.clientConfig.Q_area);
			regClass("data.map.Q_map", com.rpgGame.coreData.clientConfig.Q_map);
			regClass("data.map.Q_map_transfer", com.rpgGame.coreData.clientConfig.Q_map_transfer);
			regClass("data.map.SceneSoundInfo", com.rpgGame.coreData.clientConfig.SceneSoundInfo);
			regClass("data.map.SceneTriggerInfo", com.rpgGame.coreData.clientConfig.SceneTriggerInfo);
			regClass("data.model.AvatarClothesEffectRes", com.rpgGame.coreData.clientConfig.AvatarClothesEffectRes);
			regClass("data.model.AvatarClothesRes", com.rpgGame.coreData.clientConfig.AvatarClothesRes);
			regClass("data.model.AvatarDeputyWeaponRes", com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes);
			regClass("data.model.AvatarHairRes", com.rpgGame.coreData.clientConfig.AvatarHairRes);
			regClass("data.model.AvatarMountRes", com.rpgGame.coreData.clientConfig.AvatarMountRes);
			regClass("data.model.AvatarWeaponEffectRes", com.rpgGame.coreData.clientConfig.AvatarWeaponEffectRes);
			regClass("data.model.AvatarWeaponRes", com.rpgGame.coreData.clientConfig.AvatarWeaponRes);
			regClass("data.model.BaZhenTuRes", com.rpgGame.coreData.clientConfig.BaZhenTuRes);
			regClass("data.model.ChangeModel", com.rpgGame.coreData.clientConfig.ChangeModel);
			regClass("data.model.HeroModel", com.rpgGame.coreData.clientConfig.HeroModel);
			regClass("data.model.MountModel", com.rpgGame.coreData.clientConfig.MountModel);
			regClass("data.monster.Q_monster", com.rpgGame.coreData.clientConfig.Q_monster);
			regClass("data.monster.Q_npc", com.rpgGame.coreData.clientConfig.Q_npc);
			regClass("data.monster.Q_scene_monster", com.rpgGame.coreData.clientConfig.Q_scene_monster);
			regClass("data.monster.Q_scene_monster_area", com.rpgGame.coreData.clientConfig.Q_scene_monster_area);
			regClass("data.Q_att_transfer", com.rpgGame.coreData.clientConfig.Q_att_transfer);
			regClass("data.Q_att_values", com.rpgGame.coreData.clientConfig.Q_att_values);
			regClass("data.Q_die", com.rpgGame.coreData.clientConfig.Q_die);
			regClass("data.Q_equip_strength", com.rpgGame.coreData.clientConfig.Q_equip_strength);
			regClass("data.Q_fightsoul", com.rpgGame.coreData.clientConfig.Q_fightsoul);
			regClass("data.Q_fightsoul_mode", com.rpgGame.coreData.clientConfig.Q_fightsoul_mode);
			regClass("data.Q_fightsoul_path", com.rpgGame.coreData.clientConfig.Q_fightsoul_path);
			regClass("data.Q_global", com.rpgGame.coreData.clientConfig.Q_global);
			regClass("data.Q_item", com.rpgGame.coreData.clientConfig.Q_item);
			regClass("data.Q_notify", com.rpgGame.coreData.clientConfig.Q_notify);
			regClass("data.Q_relation", com.rpgGame.coreData.clientConfig.Q_relation);
			regClass("data.Q_tipsinfo", com.rpgGame.coreData.clientConfig.Q_tipsinfo);
			regClass("data.Q_windowInfo", com.rpgGame.coreData.clientConfig.Q_windowInfo);
			regClass("data.RaceNameInfo", com.rpgGame.coreData.clientConfig.RaceNameInfo);
			regClass("data.RacingInfo", com.rpgGame.coreData.clientConfig.RacingInfo);
			regClass("data.RacingQuestion", com.rpgGame.coreData.clientConfig.RacingQuestion);
			regClass("data.res.AvatarResConfig", com.rpgGame.coreData.clientConfig.AvatarResConfig);
			regClass("data.SceneCharPatrolInfo", com.rpgGame.coreData.clientConfig.SceneCharPatrolInfo);
			regClass("data.SocketErrorNoteInfo", com.rpgGame.coreData.clientConfig.SocketErrorNoteInfo);
			regClass("data.spell.Attach", com.rpgGame.coreData.clientConfig.Attach);
			regClass("data.spell.Attach_effect", com.rpgGame.coreData.clientConfig.Attach_effect);
			regClass("data.spell.Q_buff", com.rpgGame.coreData.clientConfig.Q_buff);
			regClass("data.spell.Q_GCD", com.rpgGame.coreData.clientConfig.Q_GCD);
			regClass("data.spell.Q_skill_ignore", com.rpgGame.coreData.clientConfig.Q_skill_ignore);
			regClass("data.spell.Q_skill_model", com.rpgGame.coreData.clientConfig.Q_skill_model);
			regClass("data.spell.Q_SpellAnimation", com.rpgGame.coreData.clientConfig.Q_SpellAnimation);
			regClass("data.spell.Q_SpellEffect", com.rpgGame.coreData.clientConfig.Q_SpellEffect);
			regClass("data.spell.Q_summon", com.rpgGame.coreData.clientConfig.Q_summon);
			regClass("data.SpriteStatNameInfo", com.rpgGame.coreData.clientConfig.SpriteStatNameInfo);
			
		}
		private static function regClass(name:String, cls:Class):void
		{
			_classMap.add(name,cls);
			registerClassAlias(name, cls);
		}
		public static function getClass(name:String):Class
		{
			return _classMap.getValue(name);
		}
	}
}

