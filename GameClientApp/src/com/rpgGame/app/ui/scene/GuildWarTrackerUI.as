package com.rpgGame.app.ui.scene
{
	import com.rpgGame.app.cmdlistener.enum.EGuildMemberType;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.WalkToRoleManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.QSinglecitybaseCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_singlecitybase;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guildWar.bean.CampOreInfo;
	import com.rpgGame.netData.guildWar.bean.CampScoreInfo;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCampOreMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCampScoreMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityBriefnessInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarOrePositionMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarPersionInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarPersonRankMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarResultMessage;
	import com.rpgGame.netData.structs.Position;
	
	import feathers.controls.Label;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.huangcheng.HuangChengJiFen_Item;
	import org.mokylin.skin.app.banghui.huangcheng.HuangCheng_ZhuiZong;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	/**
	 *帮会战追踪 
	 * @author dik
	 * 
	 */
	public class GuildWarTrackerUI extends SceneTrackerUI
	{
		private var _skin:HuangCheng_ZhuiZong;
		
		private var icon1:IconCDFace;
		private var icon2:IconCDFace;
		private var icon3:IconCDFace;
		
		private var iteminfo1:ClientItemInfo;
		private var iteminfo2:ClientItemInfo;
		private var iteminfo3:ClientItemInfo;
		private var leftTime3:int;
		private var leftTime2:int;
		private var leftTime1:int;
		private var leftTime:int;
		private var cfg:Q_singlecitybase;

		private var defendCmapId:int;
		
		private var weiczbItems:Array=[5088,5089,5090];
		private var wangczbItems:Array=[5091,5092,5095];
		private var huangczbItems:Array=[5093,5094,5096];
		private var oreID:Array=[];
		
		private var maps:Array=[900,901,902];
		private var items:Array;
		private var toPoint:Position;
		
		public function GuildWarTrackerUI()
		{
			_skin=new HuangCheng_ZhuiZong();
			super(_skin);
			toPoint=new Position();
			var mapId:int=MainRoleManager.actorInfo.mapID;
			var labelNum:int;
			switch(mapId){
				case maps[0]:
					items=weiczbItems;
					iteminfo1=new ClientItemInfo(items[0]);
					iteminfo2=new ClientItemInfo(items[1]);
					iteminfo3=new ClientItemInfo(items[2]);
					labelNum=2;
					break;
				case maps[1]:
					items=wangczbItems;
					iteminfo1=new ClientItemInfo(items[0]);
					iteminfo2=new ClientItemInfo(items[1]);
					iteminfo3=new ClientItemInfo(items[2]);
					labelNum=4;
					break;
				case maps[2]:
					items=huangczbItems;
					iteminfo1=new ClientItemInfo(items[0]);
					iteminfo2=new ClientItemInfo(items[1]);
					iteminfo3=new ClientItemInfo(items[2]);
					labelNum=4;
					break;
			}
			
			for(var i:int=0;i<labelNum;i++){
				var label:Label=new Label();
				label.width=247;
				label.height=18;
				_skin.scroll_box.addChild(label);
				_skin.scroll_box.height=i*20;
			}
			_skin.grpFoot.y=_skin.scroll_box.y+_skin.scroll_box.height+20;
			_skin.bg.height=_skin.scroll_box.height+_skin.grpFoot.height+60;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_Exit:
					DungeonSender.reqQuitDungeon();
					(MainRoleManager.actor.headFace as HeadFace).updateGuildWarInfoBar(null);
					break;
				case _skin.lbInfo1:
					if(leftTime1==0){
						GuildWarSender.reqGetOrePosition(oreID[0]);
					}
					break;
				case _skin.lbInfo3:
					if(leftTime2==0){
						GuildWarSender.reqGetOrePosition(oreID[1]);
					}
					break;
				case _skin.lbInfo4:
					if(leftTime3==0){
						GuildWarSender.reqGetOrePosition(oreID[2]);
					}
					break;
				case _skin.lbShangjiao:
					MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId, toPoint.x, toPoint.y);
					break;
			}
		}
		
		override protected function onShow() : void
		{
			super.onShow();
			icon1=FaceUtil.creatIconCDFaceByUIAsset(_skin.sec_ico1_0,IcoSizeEnum.ICON_48);
			icon2=FaceUtil.creatIconCDFaceByUIAsset(_skin.sec_ico1_1,IcoSizeEnum.ICON_48);
			icon3=FaceUtil.creatIconCDFaceByUIAsset(_skin.sec_ico1_2,IcoSizeEnum.ICON_48);
			FaceUtil.SetItemGrid(icon1,iteminfo1);
			FaceUtil.SetItemGrid(icon2,iteminfo2);
			FaceUtil.SetItemGrid(icon3,iteminfo3);
			initEvent();
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(GuildEvent.GUILD_WAR_CAMPORE,getOre);
			EventManager.addEvent(GuildEvent.GUILD_WAR_PERSONRANK,getRank);
			EventManager.addEvent(GuildEvent.GUILD_WAR_PERSIONINFO,getPlayerInfo);
			EventManager.addEvent(GuildEvent.GUILD_WAR_CAMPSCORE,getCampScore);
			EventManager.addEvent(GuildEvent.GUILD_WCZB_FIGHTCITY,getCityInfo);
			EventManager.addEvent(GuildEvent.GUILD_WAR_FINDORE,toOre);
			EventManager.addEvent(GuildEvent.GUILD_WCZB_OVER,overWczb);
		}
		
		private function overWczb(msg:ResGuildWarResultMessage):void
		{
			var mapId:int=MainRoleManager.actorInfo.mapID;
			if(mapId==maps[2]){
				AppManager.showApp(AppConstant.GUILD_HCZB_RESULT,msg);
			}else{
				AppManager.showApp(AppConstant.GUILD_WCZB_RESULT,[msg,cfg,defendCmapId]);
			}
		}
		
		private function getCityInfo(msg:ResGuildWarCityBriefnessInfoMessage):void
		{
			var name:String=EnumCity.getCityName(msg.cityId,ClientConfig.loginAreaId)
			_skin.lbHeadName.text=name.substr(1,name.length-2)+"争霸战";
			
			cfg=QSinglecitybaseCfgData.getCityCfg(msg.cityId);
			defendCmapId=msg.defendCmapId;
			leftTime=msg.endTime;
			TimerServer.addLoop(updateTime,1000);
			if(GuildManager.instance().isLeader){//是统帅
				EventManager.dispatchEvent(SpellEvent.SHOW_GUILD_LEADER_SPELL);
			}
			
			
			
			/*var myCamp:int=MainRoleManager.actorInfo.faction;
			var testMsg:ResGuildWarResultMessage=new ResGuildWarResultMessage();
			testMsg.winCampId=myCamp;
			testMsg.winCampName="11";
			testMsg.lostCampId=2;
			testMsg.lostCampName="22";
			testMsg.myCampScore=100;
			testMsg.myKillCnt=10;
			testMsg.myRank=1;
			testMsg.mySource=10;
			AppManager.showApp(AppConstant.GUILD_WCZB_RESULT,[testMsg,cfg,defendCmapId]);*/
		}
		
		private function toOre(msg:ResGuildWarOrePositionMessage):void
		{
			var mapId:int=MainRoleManager.actorInfo.mapID;
			MainRoleSearchPathManager.walkToScene(mapId,msg.position.x,msg.position.y,onArrive,10,msg.monsterId);
		}
		
		private function onArrive(id:long):void
		{
			var sceneRole:SceneRole= SceneManager.getSceneObjByID(id.ToGID()) as SceneRole;
			if(sceneRole){
				WalkToRoleManager.onCollect(sceneRole);
			}
		}
		
		private function getCampScore(msg:ResGuildWarCampScoreMessage):void
		{
			var myCamp:int=MainRoleManager.actorInfo.faction;
			var upP:Array=QSinglecitybaseCfgData.getSubmitPoint(cfg,myCamp);
			if(upP){
				toPoint.x=upP[0];
				toPoint.y=upP[1];
			}
			var max:int=cfg.q_integral_victory;
			for(var i:int=0;i<msg.infos.length;i++){
				var info:CampScoreInfo=msg.infos[i];
				if(info.campId==myCamp){
					(_skin.scroll_box.getChildAt(i) as Label).htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,info.name)+"总积分:"+info.score+"/"+max;
				}else{
					(_skin.scroll_box.getChildAt(i) as Label).htmlText=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,info.name)+"总积分:"+info.score+"/"+max;
				}
			}
		}
		
		private function getPlayerInfo(msg:ResGuildWarPersionInfoMessage):void
		{
			_skin.lbJifen.htmlText="本人积分:"+msg.score;
			_skin.lbPaiming.htmlText="本人排名:"+msg.rank;
			_skin.lbJisha.htmlText="累计击杀玩家数:"+msg.allKillCnt;
			
			if(GuildManager.instance().isLeader){
				EventManager.dispatchEvent(GuildEvent.GUILD_LEADER_SKILL_SHOW,msg);
			}
		}
		
		private function getRank(msg:ResGuildWarPersonRankMessage):void
		{
			var num:int=msg.infos.length;
			for(var i:int=0;i<3;i++){
				var itemI:int=i+1; 
				if(i<num){
					(_skin["item"+itemI].skin as HuangChengJiFen_Item).lbNo.text=msg.infos[i].rank.toString();
					(_skin["item"+itemI].skin as HuangChengJiFen_Item).lbName.text=msg.infos[i].playerName;
					(_skin["item"+itemI].skin as HuangChengJiFen_Item).lbNum.text=msg.infos[i].score.toString();
				}else{
					(_skin["item"+itemI].skin as HuangChengJiFen_Item).lbNo.text="";
					(_skin["item"+itemI].skin as HuangChengJiFen_Item).lbName.text="";
					(_skin["item"+itemI].skin as HuangChengJiFen_Item).lbNum.text="";
				}
			}
		}
		
		private function getOre(msg:ResGuildWarCampOreMessage):void
		{
			var num:int=msg.infos.length;
			var info:CampOreInfo;
			for(var i:int=0;i<num;i++){
				info=msg.infos[i];
				if(info.oreCfgId==items[0]){
					_skin.lbInfo0.text="剩余:"+info.curNum+"/"+info.maxNum;
					oreID[0]=info.oreId;
					if(info.nextRefreshTime!=0){
						leftTime1=info.nextRefreshTime;
					}else{
						_skin.lbInfo1.htmlText=HtmlTextUtil.underLine("前往采集");
					}
				}else if(info.oreCfgId==items[1]){
					_skin.lbInfo2.text="剩余:"+info.curNum+"/"+info.maxNum;
					if(info.nextRefreshTime!=0){
						leftTime2=info.nextRefreshTime;
					}else{
						_skin.lbInfo3.htmlText=HtmlTextUtil.underLine("前往采集");
					}
					oreID[1]=info.oreId;
				}else{
					_skin.lbInfo5.text="剩余:"+info.curNum+"/"+info.maxNum;
					oreID[2]=info.oreId;
					if(info.nextRefreshTime!=0){
						leftTime3=info.nextRefreshTime;
					}else{
						_skin.lbInfo4.htmlText=HtmlTextUtil.underLine("前往采集");
					}
				}
			}
		}
		
		private function updateTime():void
		{
			if(leftTime1>0){
				leftTime1--;
				_skin.lbInfo1.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,TimeUtil.formatTimeToTimeString(leftTime1))+"秒后刷出";
			}else{
				_skin.lbInfo1.htmlText=HtmlTextUtil.underLine("前往采集");
			}
			if(leftTime2>0){
				leftTime2--;
				_skin.lbInfo3.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,TimeUtil.formatTimeToTimeString(leftTime2))+"秒后刷出";
			}else{
				_skin.lbInfo3.htmlText=HtmlTextUtil.underLine("前往采集");
			}
			if(leftTime3>0){
				leftTime3--;
				_skin.lbInfo4.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,TimeUtil.formatTimeToTimeString(leftTime3))+"秒后刷出";
			}else{
				_skin.lbInfo4.htmlText=HtmlTextUtil.underLine("前往采集");
			}
			
			if(leftTime>0){
				leftTime--;
				_skin.lbTime.text="活动结束倒计时:"+TimeUtil.format3TimeType(leftTime);
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GUILD_WAR_CAMPORE,getOre);
			EventManager.removeEvent(GuildEvent.GUILD_WAR_PERSONRANK,getRank);
			EventManager.removeEvent(GuildEvent.GUILD_WAR_PERSIONINFO,getPlayerInfo);
			EventManager.removeEvent(GuildEvent.GUILD_WAR_CAMPSCORE,getCampScore);
			EventManager.removeEvent(GuildEvent.GUILD_WCZB_FIGHTCITY,getCityInfo);
			EventManager.removeEvent(GuildEvent.GUILD_WAR_FINDORE,toOre);
			EventManager.removeEvent(GuildEvent.GUILD_WCZB_OVER,overWczb);
			TimerServer.remove(updateTime);
			if(GuildManager.instance().isLeader){//是统帅
				EventManager.dispatchEvent(SpellEvent.HIDE_GUILD_LEADER_SPELL);
			}
			icon1.destroy();
			icon2.destroy();
			icon3.destroy();
			icon1=null;
			icon2=null;
			icon3=null;
			(MainRoleManager.actor.headFace as HeadFace).updateGuildWarInfoBar(null);
			EventManager.dispatchEvent(GuildEvent.GUILD_LEADER_SKILL_SHOW,null);
		}
	}
}