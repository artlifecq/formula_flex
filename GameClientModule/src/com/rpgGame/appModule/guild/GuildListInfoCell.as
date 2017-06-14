package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.netData.guild.bean.GuildListInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.banghui.TeamItem1_Skin;
	
	import starling.display.DisplayObject;
	
	public class GuildListInfoCell extends DefaultListItemRenderer
	{
		private var _skin:TeamItem1_Skin;
		private var _levelInfo:Q_guild;
		public function GuildListInfoCell():void
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin = new TeamItem1_Skin();
			_skin.toSprite(this);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(_skin.btnAdd == target)
			{
				GuildManager.instance().reqGuildJoin(info.guildId,0);
			}else{
				AppManager.showApp(AppConstant.GUILD_APPLAYINFO_PANEL,info.guildId);
			}
		
		}
		override protected function commitData():void
		{
			_levelInfo = GuildCfgData.getLevelInfo(info.guildLevel);
			if(info.rank<4)
			{
				_skin.numList2.visible = false;
				_skin.numList.visible = true;
				_skin.numList.label = info.rank.toString();
			}else{
				_skin.numList.visible = false;
				_skin.numList2.visible = true;
				_skin.numList2.text = info.rank.toString();
			}
			
			_skin.lbTeamName.text = info.guildName;
			_skin.lbLevel.text = info.guildLevel.toString();
			_skin.lbRolenName.text = info.chiefName;
			_skin.lbNum.text = info.guildMemberNum.toString()+"/"+_levelInfo.q_max_num.toString();
			_skin.lbZhanli.text = info.allBattle.toString();
			
			if(info.guildMemberNum >= _levelInfo.q_max_num)
			{
				_skin.lbFull.visible = true;
				_skin.btnAdd.visible = false;
			}else{
				_skin.lbFull.visible = false;
				_skin.btnAdd.visible = true;
				
				if(info.isApply)
				{
					_skin.btnAdd.label = "已申请";
					_skin.btnAdd.isEnabled = false;
				}else if(info.isAutoJoin==0){
					_skin.btnAdd.label = "申请加入";
					_skin.btnAdd.isEnabled = true;
				}else{
					_skin.btnAdd.label = "加入";
					_skin.btnAdd.isEnabled = true;
				}
			}
		}
		private function get info():GuildListInfo
		{
			return this.data as GuildListInfo;
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