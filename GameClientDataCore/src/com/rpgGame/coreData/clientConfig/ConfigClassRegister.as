package com.rpgGame.coreData.clientConfig
{
	import flash.net.registerClassAlias;
	import org.client.mainCore.ds.HashMap;
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author fly.AutoUICreater
	* @modifier L.L.M.Sunny
	* 修改时间：2015-7-2 上午10:05:12
	* 
	*/
	public class ConfigClassRegister
	{
		private static var _classMap:HashMap = new HashMap();
				/**  镖局详细信息类型名	 */
		public static const BiaoJuTypeInfo:String = "data.BiaoJuTypeInfo";
		/**  客户端区域数据								 */
		public static const ClientArea:String = "data.ClientArea";
		/**  客户端自定义buff				 */
		public static const ClientBuff:String = "data.ClientBuff";
		/**  客户端对话数据									 */
		public static const ClientDialog:String = "data.ClientDialog";
		/**  客户端的场景 */
		public static const ClientScene:String = "data.ClientScene";
		/**  客户端在场景中的特效						 */
		public static const ClientSceneEffect:String = "data.ClientSceneEffect";
		/**  客户端在场景中的NPC									 */
		public static const ClientSceneNPC:String = "data.ClientSceneNPC";
		/**  客户端在场景中的特效						 */
		public static const ClientSceneRole:String = "data.ClientSceneRole";
		/**  客户端触发数据															 */
		public static const ClientTrigger:String = "data.ClientTrigger";
		/**  asdasd */
		public static const CountryUnionStatInfo:String = "data.CountryUnionStatInfo";
		/**  国战城门配置		 */
		public static const CountryWarChengMenInfo:String = "data.CountryWarChengMenInfo";
		/**  内政条目	 */
		public static const CrownNeiZhenInfo:String = "data.CrownNeiZhenInfo";
		/**  王权分页配置					 */
		public static const CrownPageInfo:String = "data.CrownPageInfo";
		/**  王权权利配置		 */
		public static const CrownQuanXianInfo:String = "data.CrownQuanXianInfo";
		/**  装备强化次数对应标示配置	 */
		public static const EquipMainStat:String = "data.EquipMainStat";
		/**  装备强化次数对应标示配置			 */
		public static const EquipRefineTimesInfo:String = "data.EquipRefineTimesInfo";
		/**  装备类型对应的名字		 */
		public static const EquipTypeNameInfo:String = "data.EquipTypeNameInfo";
		/**  客户端表情配置					 */
		public static const FaceInfo:String = "data.FaceInfo";
		/**  游戏音乐配置表							 */
		public static const GameSoundInfo:String = "data.GameSoundInfo";
		/**  设置的主键#设置的主键，不重复就行	设置备注#设置备注	玻璃效果颜色#玻璃效果颜色	摄像机Y偏移#摄像机Y偏移	摄像机转角#摄像机转角	摄像机仰角#摄像机仰角	摄像机最小仰角#摄像机最小仰角	摄像机最大仰角#摄像机最大仰角	摄像机距离#摄像机距离	摄像机拖拽速度#摄像机鼠标拖拽速度	摄像机最小距离#摄像机最小距离	摄像机最大距离#摄像机最大距离	摄像机滚轮速度#摄像机鼠标滚轮速度	摄像机远裁切#摄像机远裁切	智能摄像机最小距离#智能摄像机最小距离	跳跃高度#跳跃高度	二级跳跃高度#二级跳跃高度	跳跃速率#跳跃速率	二级跳跃速率#二级跳跃速率	跳跃结束时间#跳跃结束时间	二级跳跃结束时间#二级跳跃结束时间	跳跃打断时间#跳跃打断时间	二级跳跃打断时间#二级跳跃打断时间	二级跳跃概率#二级跳跃概率（0~100）	跳跃开始时间#跳跃开始时间	二级跳跃开始时间#二级跳跃开始时间	死亡效果类型#死亡效果类型	外发光强度#外发光强度	外发光大小#外发光大小	外发光品质#外发光品质	外发光敌方颜色#外发光敌方颜色	外发光友方颜色#外发光友方颜色	外发光中立方颜色#外发光中立方颜色	半身像偏移#半身像偏移	头像偏移#头像偏移	Boss头像偏移#Boss头像偏移 */
		public static const GlobalSetting:String = "data.GlobalSetting";
		/**  GM命令							 */
		public static const GmInfo:String = "data.GmInfo";
		/**  箭头引导配置表					 */
		public static const GuideInfo:String = "data.GuideInfo";
		/**  广播，提示语				 */
		public static const HintInfo:String = "data.HintInfo";
		/**  每一种提示类型的配置		宽度	高度	位置X	位置Y																							 */
		public static const HintTypeSetInfo:String = "data.HintTypeSetInfo";
		/**  分层剧情事件配置											 */
		public static const LayerStoryEventInfo:String = "data.LayerStoryEventInfo";
		/**  分层剧情场景配置		 */
		public static const LayerStoryInfo:String = "data.LayerStoryInfo";
		/**  分层剧情npc配置						 */
		public static const LayerStoryNpcInfo:String = "data.LayerStoryNpcInfo";
		/**  角色在坐骑状态下，人物身体的偏移量， 一些比较高大的坐骑，人物身体会被淹没，加一个y的偏移	 */
		public static const MountBodyOffsetInfo:String = "data.MountBodyOffsetInfo";
		/**  坐骑根骨等级对应标示配置			 */
		public static const MountVitalityLevelInfo:String = "data.MountVitalityLevelInfo";
		/**  功能开启配置							 */
		public static const OpenFunctionInfo:String = "data.OpenFunctionInfo";
		/**  职业对应的名字		 */
		public static const RaceNameInfo:String = "data.RaceNameInfo";
		/**  赛马模型等配置信息								 */
		public static const RacingInfo:String = "data.RacingInfo";
		/**  赛马答题验证配置信息						 */
		public static const RacingQuestion:String = "data.RacingQuestion";
		/**  在场景中巡逻的NPC，角色，怪物等，信息配置	在场景中巡逻的NPC，角色，怪物等，信息配置									 */
		public static const SceneCharPatrolInfo:String = "data.SceneCharPatrolInfo";
		/**  场景音效配置信息				 */
		public static const SceneSoundInfo:String = "data.SceneSoundInfo";
		/**  场景触发器配置表								 */
		public static const SceneTriggerInfo:String = "data.SceneTriggerInfo";
		/**  socket返回错误码提示			 */
		public static const SocketErrorNoteInfo:String = "data.SocketErrorNoteInfo";
		/**  属性的名字（针对不同的地方可以有不同的配置）	 */
		public static const SpriteStatNameInfo:String = "data.SpriteStatNameInfo";
		/**  版本更新信息			 */
		public static const VersionUpdateInfo:String = "data.VersionUpdateInfo";
		/**  换装衣服资源配置，ID只能填1-255，第一套不用填，从第二套开始		头发资源ID	男身体资源名称		女身体资源名称	 */
		public static const AvatarClothesRes:String = "data.model.AvatarClothesRes";
		/**  换装副武器资源配置 */
		public static const AvatarDeputyWeaponRes:String = "data.model.AvatarDeputyWeaponRes";
		/**  换装头发资源配置ID			 */
		public static const AvatarHairRes:String = "data.model.AvatarHairRes";
		/**  换装坐骑资源配置ID		 */
		public static const AvatarMountRes:String = "data.model.AvatarMountRes";
		/**  换装武器资源配置ID只能 1-1023按照职业顺序，1-7循环。							 */
		public static const AvatarWeaponRes:String = "data.model.AvatarWeaponRes";
		/**  换装头发资源配置ID		 */
		public static const BaZhenTuRes:String = "data.model.BaZhenTuRes";
		/**  角色类型ID，ID只能填1-4，1是身体0，2是身体1，性别决定穿什么样的衣服AvatarClothesRes表来决定	功能名称，程序不读，策划自己看	衣服资源ID	武器资源ID	男空手动画资源名称	女空手动画资源名称	男重剑动画资源名称	女重剑动画资源名称	男霸刀动画资源名称	女霸刀动画资源名称	男银枪动画资源名称	女银枪动画资源名称	男羽扇动画资源名称	女羽扇动画资源名称	男法杖动画资源名称	女法杖动画资源名称	男神弓动画资源名称	女神弓动画资源名称	男狂斧动画资源名称	女狂斧动画资源名称 */
		public static const HeroModel:String = "data.model.HeroModel";
		/**  坐骑模型表	功能名称，程序不读，策划自己看	空手动画资源名称	重剑动画资源名称	霸刀动画资源名称	银枪动画资源名称	羽扇动画资源名称	法杖动画资源名称	神弓动画资源名称	狂斧动画资源名称 */
		public static const MountModel:String = "data.model.MountModel";
		/**  名称备注	资源路径#资源路径	动画名称#动画名称	碰撞隐藏节点#碰撞隐藏节点，用;分割多个节点	消散时间#消散时间	前轴围绕半径#前轴围绕半径	前轴围绕角速度#前轴围绕角速度（度/秒）	收敛次数#收敛次数	围绕半径#围绕半径	围绕角速度#围绕角速度（度/秒） */
		public static const EffectAnimation:String = "data.animat.EffectAnimation";
		/**  GM等级增加技能点配置		 */
		public static const GmLevelAddSpellPoint:String = "data.demo.GmLevelAddSpellPoint";
		/**  换装资源配置											 */
		public static const AvatarResConfig:String = "data.res.AvatarResConfig";

		public static function setup():void
		{
			regClass("data.BiaoJuTypeInfo", com.rpgGame.coreData.clientConfig.BiaoJuTypeInfo);
			regClass("data.ClientArea", com.rpgGame.coreData.clientConfig.ClientArea);
			regClass("data.ClientBuff", com.rpgGame.coreData.clientConfig.ClientBuff);
			regClass("data.ClientDialog", com.rpgGame.coreData.clientConfig.ClientDialog);
			regClass("data.ClientScene", com.rpgGame.coreData.clientConfig.ClientScene);
			regClass("data.ClientSceneEffect", com.rpgGame.coreData.clientConfig.ClientSceneEffect);
			regClass("data.ClientSceneNPC", com.rpgGame.coreData.clientConfig.ClientSceneNPC);
			regClass("data.ClientSceneRole", com.rpgGame.coreData.clientConfig.ClientSceneRole);
			regClass("data.ClientTrigger", com.rpgGame.coreData.clientConfig.ClientTrigger);
			regClass("data.CountryUnionStatInfo", com.rpgGame.coreData.clientConfig.CountryUnionStatInfo);
			regClass("data.CountryWarChengMenInfo", com.rpgGame.coreData.clientConfig.CountryWarChengMenInfo);
			regClass("data.CrownNeiZhenInfo", com.rpgGame.coreData.clientConfig.CrownNeiZhenInfo);
			regClass("data.CrownPageInfo", com.rpgGame.coreData.clientConfig.CrownPageInfo);
			regClass("data.CrownQuanXianInfo", com.rpgGame.coreData.clientConfig.CrownQuanXianInfo);
			regClass("data.EquipMainStat", com.rpgGame.coreData.clientConfig.EquipMainStat);
			regClass("data.EquipRefineTimesInfo", com.rpgGame.coreData.clientConfig.EquipRefineTimesInfo);
			regClass("data.EquipTypeNameInfo", com.rpgGame.coreData.clientConfig.EquipTypeNameInfo);
			regClass("data.FaceInfo", com.rpgGame.coreData.clientConfig.FaceInfo);
			regClass("data.GameSoundInfo", com.rpgGame.coreData.clientConfig.GameSoundInfo);
			regClass("data.GlobalSetting", com.rpgGame.coreData.clientConfig.GlobalSetting);
			regClass("data.GmInfo", com.rpgGame.coreData.clientConfig.GmInfo);
			regClass("data.GuideInfo", com.rpgGame.coreData.clientConfig.GuideInfo);
			regClass("data.HintInfo", com.rpgGame.coreData.clientConfig.HintInfo);
			regClass("data.HintTypeSetInfo", com.rpgGame.coreData.clientConfig.HintTypeSetInfo);
			regClass("data.LayerStoryEventInfo", com.rpgGame.coreData.clientConfig.LayerStoryEventInfo);
			regClass("data.LayerStoryInfo", com.rpgGame.coreData.clientConfig.LayerStoryInfo);
			regClass("data.LayerStoryNpcInfo", com.rpgGame.coreData.clientConfig.LayerStoryNpcInfo);
			regClass("data.MountBodyOffsetInfo", com.rpgGame.coreData.clientConfig.MountBodyOffsetInfo);
			regClass("data.MountVitalityLevelInfo", com.rpgGame.coreData.clientConfig.MountVitalityLevelInfo);
			regClass("data.OpenFunctionInfo", com.rpgGame.coreData.clientConfig.OpenFunctionInfo);
			regClass("data.RaceNameInfo", com.rpgGame.coreData.clientConfig.RaceNameInfo);
			regClass("data.RacingInfo", com.rpgGame.coreData.clientConfig.RacingInfo);
			regClass("data.RacingQuestion", com.rpgGame.coreData.clientConfig.RacingQuestion);
			regClass("data.SceneCharPatrolInfo", com.rpgGame.coreData.clientConfig.SceneCharPatrolInfo);
			regClass("data.SceneSoundInfo", com.rpgGame.coreData.clientConfig.SceneSoundInfo);
			regClass("data.SceneTriggerInfo", com.rpgGame.coreData.clientConfig.SceneTriggerInfo);
			regClass("data.SocketErrorNoteInfo", com.rpgGame.coreData.clientConfig.SocketErrorNoteInfo);
			regClass("data.SpriteStatNameInfo", com.rpgGame.coreData.clientConfig.SpriteStatNameInfo);
			regClass("data.VersionUpdateInfo", com.rpgGame.coreData.clientConfig.VersionUpdateInfo);
			regClass("data.model.AvatarClothesRes", com.rpgGame.coreData.clientConfig.AvatarClothesRes);
			regClass("data.model.AvatarDeputyWeaponRes", com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes);
			regClass("data.model.AvatarHairRes", com.rpgGame.coreData.clientConfig.AvatarHairRes);
			regClass("data.model.AvatarMountRes", com.rpgGame.coreData.clientConfig.AvatarMountRes);
			regClass("data.model.AvatarWeaponRes", com.rpgGame.coreData.clientConfig.AvatarWeaponRes);
			regClass("data.model.BaZhenTuRes", com.rpgGame.coreData.clientConfig.BaZhenTuRes);
			regClass("data.model.HeroModel", com.rpgGame.coreData.clientConfig.HeroModel);
			regClass("data.model.MountModel", com.rpgGame.coreData.clientConfig.MountModel);
			regClass("data.animat.EffectAnimation", com.rpgGame.coreData.clientConfig.EffectAnimation);
			regClass("data.demo.GmLevelAddSpellPoint", com.rpgGame.coreData.clientConfig.GmLevelAddSpellPoint);
			regClass("data.res.AvatarResConfig", com.rpgGame.coreData.clientConfig.AvatarResConfig);

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
		