package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.netData.guild.bean.GuildBriefnessInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.TanKuang_JianJie;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *帮派简介信息面板 
	 * @author dik
	 * 
	 */
	public class GuildBriefnessInfoPanel extends SkinUIPanel
	{
		private var _skin:TanKuang_JianJie;
		private var _levelInfo:Q_guild;
		private var _targetInfo:GuildBriefnessInfo;
		
		public function GuildBriefnessInfoPanel():void
		{
			_skin = new TanKuang_JianJie();
			super(_skin);
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=(this.parent.width-this.width)/2;
			this.y=(this.parent.height-this.height)/2;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_targetInfo=data as GuildBriefnessInfo;
			refeashView(_targetInfo);
		}
		
		private function refeashView(info:GuildBriefnessInfo):void
		{
			_levelInfo = GuildCfgData.getLevelInfo(info.level);
			_skin.lbBanghuiName.text = info.name;
			_skin.lbXuanyan.text = info.memberNum.toString()+"/"+_levelInfo.q_max_num.toString();
			_skin.lbBangZhuName.text = info.chiefName;
			_skin.lbXuanyan.text = info.note;
			_skin.lbVip.visible = info.chiefVip == 1;
			
			if(GuildManager.instance().haveGuild)
			{
				_skin.btnOk.visible = false;
			}else{
				_skin.btnOk.visible = true;
				if(info.isApply)
				{
					_skin.btnOk.label = "已申请";
					GrayFilter.gray(_skin.btnOk);
				}else{
					_skin.btnOk.label = "申请";
					_skin.btnOk.filter = null;
				}
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btnOk)
			{
				if(_targetInfo.isApply)
				{
					this.hide();
				}else{
					replayapplay();
				}
			}
		}
		
		private function replayapplay():void
		{
			_targetInfo.isApply = 1;
			GuildSender.reqGuildJoin(_targetInfo.id,0);
			EventManager.dispatchEvent(GuildEvent.GET_GUILD_LIST);
			_skin.btnOk.label = "已申请";
			GrayFilter.gray(_skin.btnOk);
		}
		
		override public function hide():void
		{
			super.hide();
		}
	}
}