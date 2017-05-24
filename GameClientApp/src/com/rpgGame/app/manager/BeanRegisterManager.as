package com.rpgGame.app.manager
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.cmdlistener.AddSpriteStatCmdListener;
	import com.rpgGame.app.cmdlistener.BaZhenTuCmdListener;
	import com.rpgGame.app.cmdlistener.BuffCmdListener;
	import com.rpgGame.app.cmdlistener.ChatCmdListener;
	import com.rpgGame.app.cmdlistener.CheatsCmdListerner;
	import com.rpgGame.app.cmdlistener.CrossCmdListener;
	import com.rpgGame.app.cmdlistener.DaTiCmdListener;
	import com.rpgGame.app.cmdlistener.DailyZoneCmdListner;
	import com.rpgGame.app.cmdlistener.DungeonCmdListener;
	import com.rpgGame.app.cmdlistener.FightSoulCmdListener;
	import com.rpgGame.app.cmdlistener.FriendCmdListener;
	import com.rpgGame.app.cmdlistener.GMCmdListener;
	import com.rpgGame.app.cmdlistener.GoodsContainerCmdListener;
	import com.rpgGame.app.cmdlistener.GuildCmdListener;
	import com.rpgGame.app.cmdlistener.HeroMiscCmdListener;
	import com.rpgGame.app.cmdlistener.HeroSearchCmdListener;
	import com.rpgGame.app.cmdlistener.JunJieContainerCmdListener;
	import com.rpgGame.app.cmdlistener.LookCmdListener;
	import com.rpgGame.app.cmdlistener.LostSkillCmdListener;
	import com.rpgGame.app.cmdlistener.MailCmdListener;
	import com.rpgGame.app.cmdlistener.MeridianCmdListerner;
	import com.rpgGame.app.cmdlistener.MiscCmdListener;
	import com.rpgGame.app.cmdlistener.NotifyCmdListener;
	import com.rpgGame.app.cmdlistener.NpcCmdListener;
	import com.rpgGame.app.cmdlistener.RoleStateCmdListener;
	import com.rpgGame.app.cmdlistener.RollCmdListener;
	import com.rpgGame.app.cmdlistener.ShopCmdListener;
	import com.rpgGame.app.cmdlistener.SpellCmdListener;
	import com.rpgGame.app.cmdlistener.StallCmdListener;
	import com.rpgGame.app.cmdlistener.SummonCmdListener;
	import com.rpgGame.app.cmdlistener.TeamCmdListerner;
	import com.rpgGame.app.cmdlistener.TradeCmdlistener;
	import com.rpgGame.app.cmdlistener.ZhanGongContainerCmdListener;
	import com.rpgGame.app.cmdlistener.clientConfig.ClientConfigCmdListener;
	import com.rpgGame.app.cmdlistener.engine.InteractiveCmdListener;
	import com.rpgGame.app.cmdlistener.engine.KeyboardCmdListener;
	import com.rpgGame.app.cmdlistener.mount.MountCmdListener;
	import com.rpgGame.app.cmdlistener.scene.SceneCmdListener;
	import com.rpgGame.app.cmdlistener.scene.SceneReleliveCmdListener;
	import com.rpgGame.app.cmdlistener.scene.SceneSpellCmdListener;
	import com.rpgGame.app.cmdlistener.scene.SceneSwitchCmdListener;
	import com.rpgGame.app.cmdlistener.scene.SceneUICmdListener;
	import com.rpgGame.app.cmdlistener.scene.StoryDungeonCmdListener;
	import com.rpgGame.app.cmdlistener.society.SocietyCmdListener;
	import com.rpgGame.app.cmdlistener.task.TaskCmdListener;
	
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import org.client.mainCore.bean.BeanManager;

	public class BeanRegisterManager
	{
		/** 配置列表 **/
		private static var _beanConfigDic : Dictionary = new Dictionary();

		/**
		 * 初始化
		 */
		public static function setup() : void
		{
			configBean();
		}

		/**
		 * 注册
		 * @param beanName
		 * @param beanClass
		 *
		 */
		private static function register(beanName : String, beanClass : Class) : void
		{
			var className : String = getQualifiedClassName(beanClass);
			if (_beanConfigDic.hasOwnProperty(className))
			{
				GameLog.throwError(new Error("重复添加Bean：" + className));
			}

			_beanConfigDic[className] = beanClass;
			BeanManager.add(beanName, beanClass);
		}

		/**
		 * 配置注册列表
		 */
		private static function configBean() : void
		{
			register("InteractiveCmdListener", InteractiveCmdListener);
			register("LookCmdListener",LookCmdListener);
			register("RoleStateCmdListener", RoleStateCmdListener);
			register("KeyboardCmdListener", KeyboardCmdListener);
			register("ClientConfigCmdListener", ClientConfigCmdListener);
			register("MiscCmdListener", MiscCmdListener);
			register("HeroMiscCmdListener", HeroMiscCmdListener);
//			register("LoginCmdListener", LoginCmdListener);
			register("SceneCmdListener", SceneCmdListener);
			register("StoryDungeonCmdListener", StoryDungeonCmdListener);
			register("SceneSpellCmdListener", SceneSpellCmdListener);
			register("BuffCmdListener",BuffCmdListener);
//			register("EquipmentCmdListener", EquipmentCmdListener);
			register("SummonCmdListener", SummonCmdListener);
			register("GMCmdListener", GMCmdListener);
			register("SceneReleliveCmdListener", SceneReleliveCmdListener);
//			register("CountryWarCmdListener", CountryWarCmdListener); //模块号98
//			register("CountryCmdListener", CountryCmdListener); //模块号104
//			register("CountryTaoNiCmdListener", CountryTaoNiCmdListener); //讨逆
//			register("TransferCmdListener", TransferCmdListener); //模块号42
//			register("CrownCmdListener", CrownCmdListener); //王权
			register("SceneSwitchCmdListener", SceneSwitchCmdListener);
			register("SceneUICmdListener", SceneUICmdListener);
			register("TaskCmdListener", TaskCmdListener); //模块号13
//			register("MiXinCmdListener", MiXinCmdListener); //模块号13
//			register("TouZhuCmdListener", TouZhuCmdListener); //模块号13
//			register("TouJingCmdListener", TouJingCmdListener); //模块号13
			register("ChatCmdListener", ChatCmdListener); //模块号12
			register("SociecyCmdListener", SocietyCmdListener); //模块号19
			register("ShopCmdListener", ShopCmdListener); //模块号7
			register("SpellCmdListener", SpellCmdListener); //模块号4
			register("MailCmdListener", MailCmdListener); //模块号18
			register("HeroSearchCmdListener", HeroSearchCmdListener); //模块号14
			register("FriendCmdListener", FriendCmdListener);
			register("TeamCmdListerner", TeamCmdListerner); //模块号15
//			register("TeamMemberPosCmdListener", TeamMemberPosCmdListener); //模块号15
			register("GoodsContainerCmdListener", GoodsContainerCmdListener);
			register("AddSpriteStatCmdListener", AddSpriteStatCmdListener);
//			register("FamilyWarCmdListener", FamilyWarCmdListener); //王城战
			register("NpcCmdListener", NpcCmdListener); //王城战
//			register("YunBiaoCmdListener", YunBiaoCmdListener); //王城战
			register("MountCmdListener", MountCmdListener); //坐骑
			register("TradeCmdlistener", TradeCmdlistener); //王城战
			register("BaZhenTuCmdListener", BaZhenTuCmdListener); //八阵图
//			register("DailyTasksCmdListener", DailyTasksCmdListener); //日常任务追踪栏事件监听
			register("GuildCmdListener", GuildCmdListener); //帮派
			register("DaTiCmdListener", DaTiCmdListener); //答题
//			register("BiaoJuCmdListener", BiaoJuCmdListener); //镖局
//			register("MazeCmdListener", MazeCmdListener); //迷宫
			register("StallCmdListener",StallCmdListener);//摆摊
//			register("YuMaQiShouCmdListener", YuMaQiShouCmdListener); //御马场、奇兽苑
			register("FightSoulCmdListener",FightSoulCmdListener);//战魂
			register("NotifyCmdListener",NotifyCmdListener);//通知消息管理
			register("LostSkillCmdListener",LostSkillCmdListener);//绝学
			register("MeridianCmdListerner",MeridianCmdListerner);
			register("ZhanGongContainerCmdListener", ZhanGongContainerCmdListener); //战功
			register("JunJieContainerCmdListener", JunJieContainerCmdListener); //军阶
			register("CheatsCmdListerner",CheatsCmdListerner);
			register("RollCmdListener",RollCmdListener);//roll掉落
			register("DungeonCmdListener",DungeonCmdListener);
			register("CrossCmdListener",CrossCmdListener);
			register("DailyZoneCmdListner",DailyZoneCmdListner);//日常副本
		}
	}
}
