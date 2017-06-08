package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.events.DungeonEvent;
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
			EventManager.addEvent(DungeonEvent.ZONE_TEAM_VOTE,teamVote);
		}
		private function removeEvent():void
		{
			EventManager.removeEvent(DungeonEvent.ZONE_TEAM_VOTE,teamVote);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch (target) {
				case _skin.btnOk:
					DungeonSender.reqTeamMatchVote(DungeonManager.voteZid,1);
					_skin.btnOk.isEnabled=false;
					_skin.btnCancel.isEnabled=false;
					break;
				case _skin.btnCancel:
					DungeonSender.reqTeamMatchVote(DungeonManager.voteZid,0);
					_skin.btnOk.isEnabled=false;
					_skin.btnCancel.isEnabled=false;
					break;
			}
			
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			addEvent();
			initVote();
			
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
			if(DungeonManager.isVote(MainRoleManager.actorInfo.serverID))
			{
				naneList[0].lbName.htmlText="<font color='#5cb006'>"+MainRoleManager.actorInfo.name+"</font>";
				naneList[0].lbOk.htmlText="<font color='#5cb006'>已同意</font>";
				_skin.btnOk.visible=false;
				_skin.btnCancel.visible=false;
				_skin.lbTips.visible=true;
			}
			else
			{
				naneList[0].lbName.htmlText="<font color='#dfb01f'>"+MainRoleManager.actorInfo.name+"</font>";
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
						if(!memberInfo.memberId.EqualTo(MainRoleManager.actorInfo.serverID))
						{
							if(DungeonManager.isVote(memberInfo.memberId))
							{
								naneList[add2].lbName.htmlText="<font color='#5cb006'>"+memberInfo.memberName+"</font>";
								naneList[add2].lbOk.htmlText="<font color='#5cb006'>已同意</font>";
							}
							else
							{
								naneList[add2].lbName.htmlText="<font color='#dfb01f'>"+memberInfo.memberName+"</font>";
								naneList[add2].lbOk.htmlText="<font color='#dfb01f'>等待同意</font>";
							}
							add2++;
						}
					}
				}
				
				
			}
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