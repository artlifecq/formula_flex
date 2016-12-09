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
	* @author NEIL
	*/
	public class ConfigClassRegister
	{
		private static var _classMap:HashMap = new HashMap();
				/**  名称备注	资源路径#资源路径	动画名称#动画名称	碰撞隐藏节点#碰撞隐藏节点，用;分割多个节点	消散时间#消散时间	前轴围绕半径#前轴围绕半径	前轴围绕角速度#前轴围绕角速度（度/秒）	收敛次数#收敛次数	围绕半径#围绕半径	围绕角速度#围绕角速度（度/秒） */
		public static const EffectAnimation:String = "data.animat.EffectAnimation";
		/**  客户端区域数据			 */
		public static const ClientArea:String = "data.ClientArea";
		/**  客户端自定义buff				 */
		public static const ClientBuff:String = "data.ClientBuff";
		/**  客户端对话数据									 */
		public static const ClientDialog:String = "data.ClientDialog";
		/**  客户端的场景																																																		 */
		public static const ClientScene:String = "data.ClientScene";
		/**  客户端在场景中的特效						 */
		public static const ClientSceneEffect:String = "data.ClientSceneEffect";
		/**  客户端在场景中的NPC									 */
		public static const ClientSceneNPC:String = "data.ClientSceneNPC";
		/**  客户端在场景中的特效						 */
		public static const ClientSceneRole:String = "data.ClientSceneRole";
		/**  客户端触发数据															 */
		public static const ClientTrigger:String = "data.ClientTrigger";
		/**  客户端表情配置					 */
		public static const FaceInfo:String = "data.FaceInfo";
		/**  游戏音乐配置表							 */
		public static const GameSoundInfo:String = "data.GameSoundInfo";
		/**  设置的主键#设置的主键，不重复就行	设置备注#设置备注	玻璃效果颜色#玻璃效果颜色	摄像机Y偏移#摄像机Y偏移	摄像机转角#摄像机转角	摄像机仰角#摄像机仰角	摄像机最小仰角#摄像机最小仰角	摄像机最大仰角#摄像机最大仰角	摄像机距离#摄像机距离	摄像机拖拽速度#摄像机鼠标拖拽速度	摄像机最小距离#摄像机最小距离	摄像机最大距离#摄像机最大距离	摄像机滚轮速度#摄像机鼠标滚轮速度	摄像机远裁切#摄像机远裁切	智能摄像机最小距离#智能摄像机最小距离	跳跃高度#跳跃高度	二级跳跃高度#二级跳跃高度	跳跃速率#跳跃速率	二级跳跃速率#二级跳跃速率	跳跃结束时间#跳跃结束时间	二级跳跃结束时间#二级跳跃结束时间	跳跃打断时间#跳跃打断时间	二级跳跃打断时间#二级跳跃打断时间	二级跳跃概率#二级跳跃概率（0~100）	跳跃开始时间#跳跃开始时间	二级跳跃开始时间#二级跳跃开始时间	死亡效果类型#死亡效果类型	外发光强度#外发光强度	外发光大小#外发光大小	外发光品质#外发光品质	外发光敌方颜色#外发光敌方颜色	外发光友方颜色#外发光友方颜色	外发光中立方颜色#外发光中立方颜色	半身像偏移#半身像偏移	头像偏移#头像偏移	Boss头像偏移#Boss头像偏移 */
		public static const GlobalSetting:String = "data.GlobalSetting";
		/**  GM命令							 */
		public static const GmInfo:String = "data.GmInfo";
		/**  广播，提示语				 */
		public static const HintInfo:String = "data.HintInfo";
		/**  每一种提示类型的配置				宽度	高度	最大宽度	项目宽度	位置X	位置Y																				 */
		public static const HintTypeSetInfo:String = "data.HintTypeSetInfo";
		/**  换装衣服特效资源配置							 */
		public static const AvatarClothesEffectRes:String = "data.model.AvatarClothesEffectRes";
		/**  换装衣服资源配置，ID只能填1-255，第一套不用填，从第二套开始		头发资源ID	身体资源名称	 */
		public static const AvatarClothesRes:String = "data.model.AvatarClothesRes";
		/**  换装副武器资源配置		 */
		public static const AvatarDeputyWeaponRes:String = "data.model.AvatarDeputyWeaponRes";
		/**  换装头发资源配置ID		 */
		public static const AvatarHairRes:String = "data.model.AvatarHairRes";
		/**  换装坐骑资源配置ID		 */
		public static const AvatarMountRes:String = "data.model.AvatarMountRes";
		/**  换装武器特效资源配置				 */
		public static const AvatarWeaponEffectRes:String = "data.model.AvatarWeaponEffectRes";
		/**  换装武器资源配置ID							 */
		public static const AvatarWeaponRes:String = "data.model.AvatarWeaponRes";
		/**  换装头发资源配置ID		 */
		public static const BaZhenTuRes:String = "data.model.BaZhenTuRes";
		/**  角色阶段ID 每个阶段对应的骨骼资源不一样，为以后角色换骨骼做准备	阶段名称	武器资源ID	兵家动画资源名称	墨家男动画资源名称	墨家女动画资源名称	医家动画资源名称 */
		public static const HeroModel:String = "data.model.HeroModel";
		/**  坐骑模型表	功能名称	动画资源名称 */
		public static const MountModel:String = "data.model.MountModel";
		/**  职业对应的名字		 */
		public static const RaceNameInfo:String = "data.RaceNameInfo";
		/**  赛马模型等配置信息								 */
		public static const RacingInfo:String = "data.RacingInfo";
		/**  赛马答题验证配置信息						 */
		public static const RacingQuestion:String = "data.RacingQuestion";
		/**  换装资源配置											 */
		public static const AvatarResConfig:String = "data.res.AvatarResConfig";
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
			regClass("data.model.AvatarClothesEffectRes", com.rpgGame.coreData.clientConfig.AvatarClothesEffectRes);
			regClass("data.model.AvatarClothesRes", com.rpgGame.coreData.clientConfig.AvatarClothesRes);
			regClass("data.model.AvatarDeputyWeaponRes", com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes);
			regClass("data.model.AvatarHairRes", com.rpgGame.coreData.clientConfig.AvatarHairRes);
			regClass("data.model.AvatarMountRes", com.rpgGame.coreData.clientConfig.AvatarMountRes);
			regClass("data.model.AvatarWeaponEffectRes", com.rpgGame.coreData.clientConfig.AvatarWeaponEffectRes);
			regClass("data.model.AvatarWeaponRes", com.rpgGame.coreData.clientConfig.AvatarWeaponRes);
			regClass("data.model.BaZhenTuRes", com.rpgGame.coreData.clientConfig.BaZhenTuRes);
			regClass("data.model.HeroModel", com.rpgGame.coreData.clientConfig.HeroModel);
			regClass("data.model.MountModel", com.rpgGame.coreData.clientConfig.MountModel);
			regClass("data.RaceNameInfo", com.rpgGame.coreData.clientConfig.RaceNameInfo);
			regClass("data.RacingInfo", com.rpgGame.coreData.clientConfig.RacingInfo);
			regClass("data.RacingQuestion", com.rpgGame.coreData.clientConfig.RacingQuestion);
			regClass("data.res.AvatarResConfig", com.rpgGame.coreData.clientConfig.AvatarResConfig);
			regClass("data.SceneCharPatrolInfo", com.rpgGame.coreData.clientConfig.SceneCharPatrolInfo);
			regClass("data.SceneSoundInfo", com.rpgGame.coreData.clientConfig.SceneSoundInfo);
			regClass("data.SceneTriggerInfo", com.rpgGame.coreData.clientConfig.SceneTriggerInfo);
			regClass("data.SocketErrorNoteInfo", com.rpgGame.coreData.clientConfig.SocketErrorNoteInfo);
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
		