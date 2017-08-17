package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.netData.guild.bean.GuildListInfo;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.TeamItem1_Skin;
	import org.mokylin.skin.common.ItemBg;
	
	import starling.display.DisplayObject;
	
	public class GuildListInfoCell extends SkinUI
	{
		private var _skin:TeamItem1_Skin;
		private var _levelInfo:Q_guild;
		private var _opaque:int;
		private var _guildid:long;
		private var _guildListinfo:GuildListInfo
		private var _indexValue:int;
		public function GuildListInfoCell(index:int=0):void
		{
			_skin = new TeamItem1_Skin();
			_indexValue=index;
			super(_skin);
		}
		
		
		private function addEvent():void
		{
			if(!EventManager.hasEvent(GuildEvent.GUILD_OPERATERESULT,opereateHandler));
				EventManager.addEvent(GuildEvent.GUILD_OPERATERESULT,opereateHandler);
		}
		private function removeEvent():void
		{
			_opaque = 0;
			if(EventManager.hasEvent(GuildEvent.GUILD_OPERATERESULT,opereateHandler));
				EventManager.removeEvent(GuildEvent.GUILD_OPERATERESULT,opereateHandler);
		}
		private function opereateHandler(msg:ResGuildOperateResultMessage):void
		{
			if(_opaque<=0)
				return ;
			if(_opaque != msg.opaque)
				return ;
			_opaque = 0;
			if(msg.result == 1&&_guildid.CompareTo(_guildListinfo.guildId)==0)
			{
				_guildListinfo.isApply = 1;
				//commitData();
				setData(_guildListinfo);
				removeEvent();
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(_guildListinfo==null)
				return ;
			if(_skin.btnAdd == target)
			{
				if(_opaque>0)
					return ;
				_opaque = GuildManager.opaque;
				_guildid = _guildListinfo.guildId;
				addEvent();
				GuildSender.reqGuildJoin(_guildListinfo.guildId,_opaque);
			}else{
//				AppManager.showApp(AppConstant.GUILD_APPLAYINFO_PANEL,_guildListinfo.guildId);
				GuildSender.reqGuildBriefnessInfo(_guildListinfo.guildId,0);
			}
		
		}
		private function updateSkin():void
		{
			var item:ItemBg = _skin.bg.skin as ItemBg;
			if(this._indexValue%2 ==0)
			{
				item.bg1.visible = true;
				item.bg2.visible = false;
			}else{
				item.bg1.visible = false;
				item.bg2.visible = true;
			}
		}
	
		public function setData(data:GuildListInfo):void
		{
			updateSkin();
			_guildListinfo = data;
			if(_guildListinfo==null)
			{
				_skin.btnAdd.visible = false;
				_skin.lbFull.visible = false;
				_skin.lbLevel.visible = false;
				_skin.lbNum.visible = false;
				_skin.lbRolenName.visible = false;
				_skin.lbTeamName.visible = false;
				_skin.lbZhanli.visible = false;
				_skin.numList.visible = false;
				_skin.numList2.visible = false;
				_skin.uiFirt.visible = false;
				return ;
			}else{
				_skin.btnAdd.visible = true;
				_skin.lbFull.visible = true;
				_skin.lbLevel.visible = true;
				_skin.lbNum.visible = true;
				_skin.lbRolenName.visible = true;
				_skin.lbTeamName.visible = true;
				_skin.lbZhanli.visible = true;
				_skin.numList.visible = true;
				_skin.numList2.visible = true;
			}
			
			_skin.uiFirt.visible = _guildListinfo.rank == 1;
			removeEvent();
			_levelInfo = GuildCfgData.getLevelInfo(_guildListinfo.guildLevel);
			if(_guildListinfo.rank<4)
			{
				_skin.numList2.visible = false;
				_skin.numList.visible = true;
				_skin.numList.label = _guildListinfo.rank.toString();
			}else{
				_skin.numList.visible = false;
				_skin.numList2.visible = true;
				_skin.numList2.text = _guildListinfo.rank.toString();
			}
			
			_skin.lbTeamName.text = _guildListinfo.guildName;
			_skin.lbLevel.text = _guildListinfo.guildLevel.toString();
			_skin.lbRolenName.text = _guildListinfo.chiefName;
			_skin.lbNum.text = _guildListinfo.guildMemberNum.toString()+"/"+_levelInfo.q_max_num.toString();
			_skin.lbZhanli.text = _guildListinfo.allBattle.toString();
			
			_skin.btnAdd.filter=null;
			if(_guildListinfo.guildMemberNum >= _levelInfo.q_max_num)
			{
				_skin.lbFull.visible = true;
				_skin.btnAdd.visible = false;
			}else{
				_skin.lbFull.visible = false;
				_skin.btnAdd.visible = true;
				
				if(_guildListinfo.isApply)
				{
					_skin.btnAdd.label = "已申请";
					_skin.btnAdd.isEnabled = false;
					_skin.btnAdd.touchable = false;
					GrayFilter.gray(_skin.btnAdd);
				}else if(_guildListinfo.isAutoJoin==0){
					_skin.btnAdd.label = "申请加入";
					_skin.btnAdd.isEnabled = true;
					_skin.btnAdd.touchable = true;
				}else{
					_skin.btnAdd.label = "加入";
					_skin.btnAdd.isEnabled = true;
					_skin.btnAdd.touchable = true;
				}
			}
		}
		
		
		override public function get width():Number
		{
			return _skin.width;
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
		
	}
}