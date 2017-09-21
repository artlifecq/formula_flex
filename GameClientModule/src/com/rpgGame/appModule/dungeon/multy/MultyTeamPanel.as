package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.NumberUtil;
	import com.rpgGame.core.utils.TextUtil;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.ZoneMultyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	import com.rpgGame.netData.zone.bean.MultiZonePanelInfo;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.fuben.FuBenTanKuang_Skin;
	import org.mokylin.skin.app.fuben.ListItem_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	/**
	 *多人副本队伍投票面板
	 */
	public class MultyTeamPanel  extends SkinUIPanel
	{
		private var _skin:FuBenTanKuang_Skin;
		private var naneList:Vector.<ListItem_Skin>;
		private var voteKey:Boolean=false;
		public function MultyTeamPanel()
		{
			_skin = new FuBenTanKuang_Skin();
			super(_skin);
			init();
		}
		private function init():void
		{
			naneList=new Vector.<ListItem_Skin>();
			var i:int;
			for(i=0;i<5;i++)
			{
				
				naneList.push(_skin["skinRole"+i].skin as ListItem_Skin);
			}
			for(i=0;i<naneList.length;i++)
			{
				naneList[i].lbName.htmlText="";
				naneList[i].lbOk.htmlText="";
			}
			
			
		}
		private function addEvent():void
		{
			removeEvent();
			EventManager.addEvent(DungeonEvent.ZONE_TEAM_VOTE,teamVote);
		}
		private function removeEvent():void
		{
			EventManager.removeEvent(DungeonEvent.ZONE_TEAM_VOTE,teamVote);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			//super.onTouchTarget(target);
			switch (target) {
				case _skin.btnOk:
					DungeonSender.reqTeamMatchVote(DungeonManager.voteZid,1);
					TimerServer.remove(updateTime);
					_skin.btnCancel.label="拒 绝";
					_skin.btnOk.isEnabled=false;
					_skin.btnCancel.isEnabled=false;
					break;
				case _skin.btnCancel:
					cancel();
					break;
				case _skin.btnClose:
					cancel();
					break;
			}
			
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			addEvent();
			initVote();
			setTime();
		}
		override public function hide():void
		{
			removeEvent();
			super.hide();
		}
		/**初始化投票*/
		private function initVote():void
		{
			var multyData:Q_zone_multy=ZoneMultyCfgData.getZoneMultyByID(DungeonManager.voteZid);
			if(multyData==null)return;
			_skin.uiFubenName.styleName="ui/app/fuben/duorenfuben/fuben_name/"+multyData.q_resurl+"/name.png";
			teamVote();
			changeVoteButton();
		}
		
		
		/**队伍投票*/
		private function teamVote():void
		{
			var i:int,add:int,add2:int;
			var memberInfo:TeamMemberInfo;
			
			var name:String="";
			var memberinfoList:Vector.<TeamMemberInfo>=TeamManager.ins.teamInfo.memberinfo;
			for(i=0;i<naneList.length;i++)
			{
				naneList[i].lbName.htmlText="";
				naneList[i].lbOk.htmlText="";
			}
			
			//naneList[0].lbName.htmlText=MainRoleManager.actorInfo.name;
			var playername:String="";
			playername=MainRoleManager.actorInfo.name;
			playername=TextUtil.getByteLen(playername)<=20?playername:TextUtil.sliceToBytelen(playername,17)+"...";
			if(DungeonManager.isVote(MainRoleManager.serverID))
			{
				naneList[0].lbName.htmlText="<font color='#5cb006'>"+playername;//+"</font>";
				naneList[0].lbOk.htmlText="<font color='#5cb006'>已同意</font>";
				_skin.btnOk.visible=false;
				_skin.btnCancel.visible=false;
				_skin.lbTips.visible=true;
			}
			else
			{
				naneList[0].lbName.htmlText="<font color='#dfb01f'>"+playername+"</font>";
				naneList[0].lbOk.htmlText="<font color='#dfb01f'>等待同意</font>";
				_skin.btnOk.visible=true;
				_skin.btnCancel.visible=true;
				_skin.btnOk.isEnabled=true;
				_skin.btnCancel.isEnabled=true;
				_skin.lbTips.visible=false;
			}
			
			add=0;
			add2=1;
			for(i=0;i<naneList.length;i++)
			{
				if(add2<naneList.length)
				{
					naneList[add2].lbName.htmlText="";
					naneList[add2].lbOk.htmlText="";
					if(add<memberinfoList.length)
					{
						memberInfo=memberinfoList[add];
						add++;
						if(!memberInfo.memberId.EqualTo(MainRoleManager.serverID))
						{
							playername=memberInfo.memberName;
							playername=TextUtil.getByteLen(playername)<=20?playername:TextUtil.sliceToBytelen(playername,17)+"...";
							if(DungeonManager.isVote(memberInfo.memberId))
							{
								naneList[add2].lbName.htmlText="<font color='#5cb006'>"+playername+"</font>";
								naneList[add2].lbOk.htmlText="<font color='#5cb006'>已同意</font>";
							}
							else
							{
								naneList[add2].lbName.htmlText="<font color='#dfb01f'>"+playername+"</font>";
								naneList[add2].lbOk.htmlText="<font color='#dfb01f'>等待同意</font>";
							}
							add2++;
						}
					}
				}
				
				
			}
		}
		private var remainTime:int;
		private function setTime():void
		{
			var rTime:int=GlobalSheetData.getSettingInfo(850)!=null?GlobalSheetData.getSettingInfo(850).q_int_value:20;
			if(rTime<=0){
				_skin.btnCancel.label="拒 绝";
			}else{
				remainTime=rTime;
				_skin.btnCancel.label="拒绝("+remainTime.toString()+")";
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		private function updateTime():void
		{
			remainTime--;
			_skin.btnCancel.label="拒绝("+remainTime.toString()+")";
			if(remainTime==0){
				cancel();
			}
		}
		
		private function cancel():void
		{
			TimerServer.remove(updateTime);
			if(!DungeonManager.isVote(MainRoleManager.serverID))
			{
				DungeonSender.reqTeamMatchVote(DungeonManager.voteZid,0);
			}
			hide();
		}
		
		
		/**自己投票*/
		private function changeVoteButton():void
		{
			
			
		}
		
		
		
		/*private function getTeamInfo(mid:long):TeamMemberInfo
		{
			
			for each(var memberInfo:TeamMemberInfo in memberinfoList)
			{
				if(memberInfo.memberId==mid)
				{
					return memberInfo;
				}
			}
			
			return null;
		}
		*/
		
		
	}
}