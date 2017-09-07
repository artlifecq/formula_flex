package com.rpgGame.appModule.guild
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.hint.TopTipManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.appModule.common.RoleModelShow;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.EnumGuildPost;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_Info;
	
	import starling.display.DisplayObject;
	
	public class GuildInfoViewUI extends ViewUI
	{
		private var _skin:BangHui_Info;
		private var _guildInfo:GuildInfoPanel;
		private var _showAvatarData : RoleData;
		private var _roleModel:RoleModelShow;
		private var _avatar : InterAvatar3D;
		private var _guildGetDailyGiftOpaque:int;
		public function GuildInfoViewUI()
		{
			_skin = new BangHui_Info();
			super(_skin);
			initView();
			addNode(RTNodeID.GUILD_INFO,RTNodeID.GUILD_REWARD,_skin.btnFuli,65,null);
		}
		private function initView():void
		{
			_guildInfo = new GuildInfoPanel();
			_guildInfo.x = 19;
			_guildInfo.y = 81;
			_showAvatarData = new RoleData(0);
			initAvatar();
		}
		
		private function initAvatar():void
		{
			_skin.uiRole.touchable=true;
			_skin.uiRole.touchGroup=false;
			
//			_roleModel.x = 594;
//			_roleModel.y = 478;
//			this.addChild(_roleModel);
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashView);
			//EventManager.addEvent(TaskEvent.TASK_FINISH_MATION,finishMation);
			finishMation(TaskType.MAINTYPE_GUILDDAILYTASK);
			refeashView();
		}
		
		private function finishMation(type:int):void
		{
			// TODO Auto Generated method stub
			if (TaskType.MAINTYPE_GUILDDAILYTASK==type) 
			{
				if (!TaskMissionManager.haveGuildTask)
				{
					GrayFilter.gray(_skin.btnRenwu);
				}
				else
				{
					GrayFilter.unGray(_skin.btnRenwu);
				}
			}
		}
		override protected function onHide():void
		{
			//EventManager.removeEvent(TaskEvent.TASK_FINISH_MATION,finishMation);
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashView);
			if(_guildInfo.parent != null)
				this.removeChild(_guildInfo);
			if (_roleModel) 
			{
				_roleModel.dispose();
				_roleModel=null;
			}
		}
		
		private function refeashView():void
		{
			if(guildData ==null)
				return ;
			refeashPanleInfo();
			updateRole();
			refeashReward();
			if(_guildInfo.parent == null)
				this.addChild(_guildInfo);
		}
		
		private function refeashReward():void
		{
			TipTargetManager.remove(_skin.btnFuli);
			if(GuildManager.instance().haveDailyGift)
			{
				var str:String = "";
				var selfMemberInfo:GuildMemberInfo = GuildManager.instance().selfMemberInfo;
				var itemInfos:Object = JSONUtil.decode(GuildManager.instance().guildLevelInfo.q_gift_data);
				var iteminfo:Object;
				if(selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_CHIEF||
					selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_AGEN_CHIEF||
					selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_VICE_CHIEF||
					selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_ELDERS)
				{
					str = LanguageConfig.replaceStr("$级帮派官员日福利\n",GuildManager.instance().guildData.level);
					iteminfo = itemInfos[1];
				}else{
					str = LanguageConfig.replaceStr("$级帮派普通成员日福利\n",GuildManager.instance().guildData.level);
					iteminfo = itemInfos[0];
				}
				var qitem:Q_item = ItemConfig.getQItemByID(iteminfo["mod"]);
				str += HtmlTextUtil.getTextColor(ItemConfig.getItemQualityColor(qitem.q_id),qitem.q_name);
				TipTargetManager.show(_skin.btnFuli,TargetTipsMaker.makeSimpleTextTips(str));
				_skin.btnFuli.filter = null;
				setRTNState(RTNodeID.GUILD_REWARD,true);
			}else{
				GrayFilter.gray(_skin.btnFuli);
				setRTNState(RTNodeID.GUILD_REWARD,false);
			}
		}
		private function refeashPanleInfo():void
		{
			_skin.NumZhanli.number = guildData.battle;
			_skin.lbBangZhu.text = guildData.chiefName;
			_skin.lbDengji.text = "Lv."+chiefGuildMemberInfo.level;
			_skin.btnZhaoji.visible = GuildManager.instance().canConvene;
			if(GuildManager.instance().canDissolve)
			{
				_skin.btnJiesan.label = "解散帮会";
			}else{
				_skin.btnJiesan.label = "退出帮派";
			}
		}
		
		private function updateRole():void
		{
			var chiefAvatar:PlayerAppearanceInfo = guildData.chiefAvatar;
			if(chiefAvatar!=null)
			{
				if (!_roleModel) 
				{
					_roleModel = new RoleModelShow(_skin.uiRole);
				}
				_roleModel.setData(chiefAvatar,1.7);
			}
		}
		
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnRenwu:
					GuildManager.instance().gotoTask();
					break;
				case _skin.btnJineng:
					FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_BANGHUI_SPELL,null,false);
					break;
				case _skin.btnZhengba:
					FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_HCZB_INFO_GUILD,null,false);
					break;
				case _skin.btnZhaoji:
					GuildSender.guildConvene();
					break;
				case _skin.btnJiesan:
					if(GuildManager.instance().canDissolve)
					{
						GuildManager.instance().guildDissolve();
					}else{
						GuildManager.instance().guildExit();
					}
					break;
				case _skin.btnFuli:
					if(_guildGetDailyGiftOpaque>0)
						return ;
					EventManager.addEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
					_guildGetDailyGiftOpaque = GuildManager.opaque;
					GuildSender.guildGetDailyGift(_guildGetDailyGiftOpaque);
					break;
			}
		}
		private function refeashAppoint(msg:ResGuildOperateResultMessage):void
		{
			if(msg.opaque != _guildGetDailyGiftOpaque)
				return ;
			_guildGetDailyGiftOpaque = 0;
			if(msg.result ==1)
			{
				var str:String = "获得奖励:\n";
				var itemInfos:Object = JSONUtil.decode(GuildManager.instance().guildLevelInfo.q_gift_data);
				var iteminfo:Object;
				var selfMemberInfo:GuildMemberInfo = GuildManager.instance().selfMemberInfo;
				if(selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_CHIEF||
					selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_AGEN_CHIEF||
					selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_VICE_CHIEF||
					selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_ELDERS)
				{
					iteminfo = itemInfos[1];
				}else{
					iteminfo = itemInfos[0];
				}
				var qitem:Q_item = ItemConfig.getQItemByID(iteminfo["mod"]);
				str += HtmlTextUtil.getTextColor(ItemConfig.getItemQualityColor(qitem.q_id),qitem.q_name);
				TopTipManager.getInstance().addMouseFollowTip(0,str);
				GuildManager.instance().changeGuildDailyGift();
				refeashReward();
				ItemActionManager.flyItemToBag(qitem.q_id,_skin.btnFuli);
			}
			EventManager.removeEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
		}
		private function get guildData():GuildInfo
		{
			return GuildManager.instance().guildData;
		}
		public function get chiefGuildMemberInfo():GuildMemberInfo
		{
			return GuildManager.instance().chiefGuildMemberInfo;
		}
	}
}