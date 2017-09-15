package com.rpgGame.appModule.guild.war
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.QKindomnameCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.clientConfig.Q_kindomname;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guildWar.bean.GuildWarCityInfo;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityInfoMessage;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_Skin;
	
	import starling.display.DisplayObject;
	
	/**
	 *王城争霸战 
	 * @author dik
	 * 
	 */
	public class WczbWarViewUI extends ViewUI
	{
		private static const UNAPPLY_STATE:int=1;
		private static const APPLYING_STATE:int=2;
		private static const PRE_WAR_STATE:int=3;
		private static const ATTACK_STATE:int=4;
		private static const DEF_STATE:int=5;
		private static const HOLD_STATE:int=6;
		private static const UNGUILD_STATE:int=7;
		private static const PRE_WAR_WC:int=8;
		private static const WAR_WC:int=9;
		private static const PRE_WAR_HC:int=10;
		private static const WAR_HC:int=11;
		private static const LOSE_HC:int=12;
		
		private var _skin:WangCheng_Skin;
		private var _currentMap:GuildWarMapUI;
		private var wczbMap:WczbMapUI;
		private var hczbMap:HczbMapUI;
		private var _infoMsg:ResGuildWarCityInfoMessage;

		private var currentCityId:int;
		private var _leftTime:int;
		private var _timeStr:String;
		private var _gTimer : GameTimer;
		private var fightInfo:GuildWarCityInfo;
		private var cityState:int;
		private var myGuildId:String;
		
		public function WczbWarViewUI()
		{
			_skin=new WangCheng_Skin();
			super(_skin);
			initView();
		}
		
		public function set currentMap(value:GuildWarMapUI):void
		{
			if(_currentMap){
				_currentMap.removeFromParent();
			}
			_currentMap = value;
			_skin.mapGrp.addChild(_currentMap);
		}

		private function initView():void
		{
			_skin.List.itemRendererType=WczbGuildFightRankItemRender;
			_skin.List.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
			_skin.List.dataProvider=new ListCollection();
			
			wczbMap=new WczbMapUI();
			hczbMap=new HczbMapUI();
			_gTimer=new GameTimer("WczbWarViewUI",1000,0,updateTime);
			_gTimer.stop();
			_skin.btnInfo.label="皇城争霸";
//			currentMap=wczbMap;
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			
			initEvent();
			
			if(data&&data==EnumCity.HUANG_CHENG){
				GuildWarSender.reqGuildWarCityInfo(1);
			}else{
				GuildWarSender.reqGuildWarCityInfo(-1);
			}
			
			GuildWarSender.reqEnterGuildWarPanel();
		}
		
		private function initEvent():void
		{
			TipTargetManager.show( _skin.btnShuoMing,TargetTipsMaker.makeSimpleTextTips( TipsCfgData.getTipsInfo(30).q_describe));
			EventManager.addEvent(GuildEvent.GUILD_WCZB_INFO,getCitysInfo);
			EventManager.addEvent(GuildEvent.GUILD_CHANGE_ACTIVE,updateAct);
		}
		
		private function updateAct(value:int):void
		{
			_skin.lbHuoYue.text=value.toString();
		}
		
		private function getCitysInfo(msg:ResGuildWarCityInfoMessage):void
		{
			_infoMsg=msg;
			showRank();
			showMap();
			showZhanshi();
			updateAct(msg.guildActive);
			updateNextBattleTime();
			
		}
		
		private function updateNextBattleTime():void
		{
			if(_infoMsg.nextWarTime>0){
				_skin.nextTitle.text="下次开战时间:";
				_skin.lbDate.text=TimeUtil.changeDateToDateStr(new Date(_infoMsg.nextWarTime*1000));
			}else{
				_skin.lbDate.text="";
				_skin.nextTitle.text="";
			}			
		}
		
		private function showZhanshi():void
		{
			currentCityId=_infoMsg.applyCityId;//自己帮派参与的城池id;
			
			if(GuildManager.instance().haveGuild){
				myGuildId=GuildManager.instance().guildData.id.hexValue;
			}
			var num:int=_infoMsg.citys.length;
			
			for(var i:int=0;i<num;i++){
				var info:GuildWarCityInfo=_infoMsg.citys[i];
				if(info.id==currentCityId){
					cityState=getCityStateForData(info,myGuildId);
					break;
				}
			}
			
			if(cityState==-1||currentCityId==-1){//没有参与城池
				if(GuildManager.instance().haveGuild){
					cityState=UNAPPLY_STATE;
					if(_currentMap==hczbMap){
						cityState=LOSE_HC;
					}
				}else{
					cityState=UNGUILD_STATE;
				}
			}
			
			updateZhanshi(cityState);
		}
		
		
		private function updateZhanshi(state:int):void
		{
			_skin.btnBaoming.touchable=true;
			_skin.btnBaoming.filter=null;
			_skin.btnJinru.filter=null;
			_skin.btnJinru.touchable=true;
			_skin.uiCheng.x=28;
			_skin.uiMyFlag.x=56;
			switch(state){
				case UNAPPLY_STATE:
					unApply();
					break;
				case APPLYING_STATE:
					applying();
					break;
				case PRE_WAR_STATE:
					preWarState();
					break;
				case ATTACK_STATE:
					attackState();
					break;
				case DEF_STATE:
					defState();
					break;
				case HOLD_STATE:
					holdState();
					break;
				case UNGUILD_STATE:
					unGuildState();
					break;
				case PRE_WAR_WC:
					preWarWC();
					break;
				case WAR_WC:
					warWC();
					break;
				case LOSE_HC:
					loseHC();
					break;
				default:
					break;
			}
		}
		
		private function loseHC():void
		{
			_skin.grpTo.visible=true;
			_skin.grpCheng.visible=false;
			_skin.btnJone.visible=false;
			_skin.btnJinPai.visible=false;
			_skin.lbTitle.text="无一席之地";
		}
		
		private function warWC():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="王城争夺中";
			_skin.lbName1.htmlText="";
			_skin.lbVs.htmlText=""
			_skin.lbName2.htmlText="";
			
			_timeStr="距离战斗结束还有:"
			_leftTime=_infoMsg.curWarTime;
			_gTimer.start();
			
			var cityInfo:GuildWarCityInfo;
			for(var i:int=0;i<	_infoMsg.citys.length;i++){
				if(_infoMsg.citys[i].id==EnumCity.WANG_CHENG){
					cityInfo=_infoMsg.citys[i];
					break;
				}
			}
			
			var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(cityInfo.areaId);
			var cityStyleName:String=EnumCity.wangchangCitys[cfg.q_id-1];
			var flagStyleName:String=EnumCity.wangChengFlags[cfg.q_id-1];
			
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
			_skin.uiCheng.x=100;
			_skin.uiMyFlag.x=128;
			_skin.btnBaoming.touchable=false;
			GrayFilter.gray(_skin.btnBaoming);
		}
		
		private function preWarWC():void
		{			
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="决战王城";
			_skin.lbName1.htmlText="";
			_skin.lbVs.htmlText=""
			_skin.lbName2.htmlText="";
			
			_timeStr="距离战斗开始还有:"
			_leftTime=_infoMsg.curWarTime;
			_gTimer.start();
			
			_skin.uiCheng.x=100;
			_skin.uiMyFlag.x=128;
			
			var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(fightInfo.areaId);
			var cityStyleName:String=EnumCity.wangchangCitys[cfg.q_id-1];
			var flagStyleName:String=EnumCity.wangChengFlags[cfg.q_id-1];
			
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
			_skin.btnBaoming.touchable=false;
			_skin.btnBaoming.filter=FilterUtil.getGrayFilter();
		}
		
		private function unGuildState():void
		{
			_skin.grpTo.visible=true;
			_skin.grpCheng.visible=false;
			_skin.lbHead.htmlText="";
			_skin.lbTitle.text="请先加入一个帮派";
			_skin.btnJone.visible=true;
			_skin.btnJinPai.visible=false;
		}
		
		private function holdState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(fightInfo.areaId);
			var cityName:String=EnumCity.getCityName(fightInfo.id,cfg.q_id);
			_skin.lbHead.htmlText="占领"+cityName;
			_skin.lbName1.htmlText="";
			_skin.lbName2.htmlText="";
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"本帮已占领"+cityName);
			_skin.lbTime.text="";
			
			var cityStyleName:String;
			var flagStyleName:String;
			switch(currentCityId){
				case EnumCity.XI_WEI:
				case EnumCity.ZHONG_WEI:
				case EnumCity.DONG_WEI:
					flagStyleName=EnumCity.weichengFlags[currentCityId-1];					
					cityStyleName=EnumCity.weichengCitys[currentCityId-1];					
					break;
				case EnumCity.WANG_CHENG:
					cityStyleName=EnumCity.wangchangCitys[cfg.q_id-1];
					flagStyleName=EnumCity.wangChengFlags[cfg.q_id-1];
					_skin.btnJinru.filter=FilterUtil.getGrayFilter();
					_skin.btnJinru.touchable=false;
					break;
			}
			
			_skin.btnBaoming.touchable=false;
			_skin.btnBaoming.filter=FilterUtil.getGrayFilter();
			
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function defState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			
			var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(fightInfo.areaId);
			var cityName:String=EnumCity.getCityName(fightInfo.id,cfg.q_id);
	
			_skin.lbHead.htmlText="防守"+cityName;
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,fightInfo.occupyGuildName);
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"VS");
			_skin.lbName2.htmlText=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,fightInfo.attackGuildName);
			_timeStr="距离战斗结束还有:"
			_leftTime=_infoMsg.curWarTime;
			_gTimer.start();
			
			var cityStyleName:String;
			var flagStyleName:String;
			switch(currentCityId){
				case EnumCity.XI_WEI:
				case EnumCity.ZHONG_WEI:
				case EnumCity.DONG_WEI:
					flagStyleName=EnumCity.weichengFlags[currentCityId-1];					
					cityStyleName=EnumCity.weichengCitys[currentCityId-1];					
					break;
				case EnumCity.WANG_CHENG:
					cityStyleName=EnumCity.wangchangCitys[cfg.q_id-1];
					flagStyleName=EnumCity.wangChengFlags[cfg.q_id-1];
					_skin.btnBaoming.filter=FilterUtil.getGrayFilter();
					_skin.btnBaoming.touchable=false;
					break;
			}
			
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function attackState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(fightInfo.areaId);
			var cityName:String=EnumCity.getCityName(fightInfo.id,cfg.q_id);
			
			_skin.lbHead.htmlText="进攻"+cityName;
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,fightInfo.attackGuildName);
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"VS");
			_skin.lbName2.htmlText=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,fightInfo.occupyGuildName);
			
			_timeStr="距离战斗结束还有:"
			_leftTime=_infoMsg.curWarTime;
			_gTimer.start();
			
			var cityStyleName:String;
			var flagStyleName:String;
			switch(currentCityId){
				case EnumCity.XI_WEI:
				case EnumCity.ZHONG_WEI:
				case EnumCity.DONG_WEI:
					flagStyleName=EnumCity.weichengFlags[currentCityId-1];					
					cityStyleName=EnumCity.weichengCitys[currentCityId-1];					
					break;
				case EnumCity.WANG_CHENG:
					cityStyleName=EnumCity.wangchangCitys[cfg.q_id-1];
					flagStyleName=EnumCity.wangChengFlags[cfg.q_id-1];
					_skin.btnBaoming.filter=FilterUtil.getGrayFilter();
					_skin.btnBaoming.touchable=false;
					break;
			}
	
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function applying():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(fightInfo.areaId);
			var cityName:String=EnumCity.getCityName(fightInfo.id,cfg.q_id);
			
			_skin.lbHead.htmlText="竞拍"+cityName;
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT1,"当前出价最高帮派:");
			if(_infoMsg.curMaxPriceGuildName){
				_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,_infoMsg.curMaxPriceGuildName);
			}else{
				_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"暂无");
			}
			_skin.lbName2.htmlText="";
			_leftTime=_infoMsg.curWarTime;
			_timeStr="距离竞拍结束还剩:";
			_gTimer.start();
			
			var cityStyleName:String;
			var flagStyleName:String;
			switch(currentCityId){
				case EnumCity.XI_WEI:
				case EnumCity.ZHONG_WEI:
				case EnumCity.DONG_WEI:
					flagStyleName=EnumCity.weichengFlags[currentCityId-1];					
					cityStyleName=EnumCity.weichengCitys[currentCityId-1];					
					break;
				case EnumCity.WANG_CHENG:
					cityStyleName=EnumCity.wangchangCitys[cfg.q_id-1];
					flagStyleName=EnumCity.wangChengFlags[cfg.q_id-1];
					_skin.btnBaoming.filter=FilterUtil.getGrayFilter();
					_skin.btnBaoming.touchable=false;
					break;
			}
			
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function updateTime():void
		{
			_leftTime--;
			_skin.lbTime.text=_timeStr+TimeUtil.format3TimeType(_leftTime);
			if(_leftTime<=0){
				_gTimer.stop();
				if(_currentMap==wczbMap){
					GuildWarSender.reqGuildWarCityInfo(0);
				}else{
					GuildWarSender.reqGuildWarCityInfo(1);
				}
			}
		}
		
		private function unApply():void
		{
			_skin.grpTo.visible=true;
			_skin.grpCheng.visible=false;
			_skin.lbHead.htmlText="";
			_skin.lbTitle.text="请先竞拍城池";
			_skin.btnJone.visible=false;
			_skin.btnJinPai.visible=true;
		}
		
		private function preWarState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(fightInfo.areaId);
			var cityName:String=EnumCity.getCityName(fightInfo.id,cfg.q_id);
			
			if(myGuildId==fightInfo.attackGuildId.hexValue){
				_skin.lbHead.htmlText="准备进攻:"+cityName;
				_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,fightInfo.attackGuildName);
				_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"VS");
				_skin.lbName2.htmlText=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,fightInfo.occupyGuildName);
			}else{
				_skin.lbHead.htmlText="准备防守:"+cityName;
				_skin.lbName2.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,fightInfo.occupyGuildName);
				_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"VS");
				_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,fightInfo.attackGuildName);
			}
			
			_timeStr="距离战斗开始还有:"
			_leftTime=_infoMsg.curWarTime;
			_gTimer.start();
			
			var cityStyleName:String;
			var flagStyleName:String;
			switch(currentCityId){
				case EnumCity.XI_WEI:
				case EnumCity.ZHONG_WEI:
				case EnumCity.DONG_WEI:
					flagStyleName=EnumCity.weichengFlags[currentCityId-1];					
					cityStyleName=EnumCity.weichengCitys[currentCityId-1];					
					break;
				case EnumCity.WANG_CHENG:
					cityStyleName=EnumCity.wangchangCitys[cfg.q_id-1];
					flagStyleName=EnumCity.wangChengFlags[cfg.q_id-1];
					_skin.btnBaoming.filter=FilterUtil.getGrayFilter();
					_skin.btnBaoming.touchable=false;
					break;
			}
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";			
		}
		
		private function getCityStateForData(info:GuildWarCityInfo,myGuildId:String):int
		{
			if(info.id!=EnumCity.WANG_CHENG&&info.id!=EnumCity.HUANG_CHENG){
				if(!info.occupyGuildId&&!info.attackGuildId){
					return -1;
				}
				if(info.state!=2&&info.attackGuildId&&info.attackGuildId.hexValue!=myGuildId&&info.occupyGuildId&&info.occupyGuildId.hexValue!=myGuildId){//攻方不是自己守方不是自己
					return -1;
				}
			}
			var result:int=1;
			fightInfo=info;
//			info.id=EnumCity.WANG_CHENG;
			switch(info.state){
				case 1://未申请
					if(info.occupyGuildId.hexValue==myGuildId){//自己占领
						result=HOLD_STATE;
					}else{
						result=UNAPPLY_STATE;
					}
					break;
				case 2://申请中
					if(info.occupyGuildId.hexValue==myGuildId){//自己占领
						result=HOLD_STATE;
					}else{
						result=APPLYING_STATE;
					}
					break;
				case 3://准备战斗
					result=PRE_WAR_STATE;
					if(info.id==EnumCity.WANG_CHENG){//是王城
						result=PRE_WAR_WC;
					}
					if(info.id==EnumCity.HUANG_CHENG){//是皇城
						result=PRE_WAR_HC;
					}
					break;
				case 4://战斗中
					if(info.occupyGuildId.hexValue==myGuildId){//防守
						result=DEF_STATE;
					}else if(info.attackGuildId.hexValue==myGuildId){//攻击
						result=ATTACK_STATE;
					}
					if(info.id==EnumCity.WANG_CHENG){//是王城
						result=WAR_WC;
					}
					if(info.id==EnumCity.HUANG_CHENG){//是皇城
						result=WAR_HC;
					}
					break;
				case 5://应该是拥有阶段
					if(info.occupyGuildId.hexValue==myGuildId){//自己占领
						result=HOLD_STATE;
					}
					break;
			}
			return result;
		}
		
		private function showMap():void
		{
			if(_infoMsg.cityType==3){
				hczbMap.setCityData(_infoMsg);
				currentMap=hczbMap;
				_skin.actName.visible=_skin.lbHuoYue.visible=false;
				_skin.btnBaoming.visible=false;
				_skin.btnShuoMing.x=58;
			}else{
				wczbMap.setCityData(_infoMsg);
				currentMap=wczbMap;
				_skin.btnShuoMing.x=323;
				_skin.actName.visible=_skin.lbHuoYue.visible=true;
				_skin.btnBaoming.visible=true;
			}
		}
		
		private function showRank():void
		{
			_skin.List.dataProvider.removeAll();
			_skin.List.customData=_currentMap;
			var num:int=_infoMsg.ranks.length;
			for(var i:int=0;i<num;i++){
				_skin.List.dataProvider.addItem(_infoMsg.ranks[i]);
			}
		}
		
		override public function hide():void
		{
			super.hide();
			TipTargetManager.remove( _skin.btnShuoMing);
			EventManager.removeEvent(GuildEvent.GUILD_WCZB_INFO,getCitysInfo);
			EventManager.removeEvent(GuildEvent.GUILD_CHANGE_ACTIVE,updateAct);
			_gTimer.stop();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(!target){
				return;
			}
			switch(target)
			{
				case _skin.btnBaoming:
				case _skin.btnJinPai:
					AppManager.showApp(AppConstant.GUILD_WCZB_APPLY,null,0,this._skin.container);
					break;
				case _skin.btnJiangli:
					if(_currentMap==wczbMap){
						AppManager.showApp(AppConstant.GUILD_WCZB_REWARD,null,0,this._skin.container);
					}else{
						AppManager.showApp(AppConstant.GUILD_HCZB_REWARD,null,0,this._skin.container);
					}
					break;
				case _skin.btnJinru:
					toEnterWar();
					break;
				case _skin.btnJone:
					AppManager.showAppNoHide(AppConstant.GUILD_PANEL,null,EmFunctionID.EM_BANGHUI_LIEBIAO);
					break;
				case _skin.btnInfo:
					if(_currentMap==wczbMap){
						currentMap=hczbMap;
						_skin.btnInfo.label="王城争霸";
						GuildWarSender.reqGuildWarCityInfo(1);
					}else{
						currentMap=wczbMap;
						_skin.btnInfo.label="皇城争霸";
						GuildWarSender.reqGuildWarCityInfo(0);
					}
					break;
			}
		}
		private function toEnterWar():void
		{
			switch(cityState){
				case UNAPPLY_STATE:
					NoticeManager.showNotifyById(60111);
					return;
				case APPLYING_STATE:
					NoticeManager.showNotifyById(60112);
					return;
				case PRE_WAR_STATE:
				case	PRE_WAR_WC:
				case	PRE_WAR_HC:
					NoticeManager.showNotifyById(60113);
					return;
				case UNGUILD_STATE:
					NoticeManager.showNotifyById(60114);
					return;
			}
			AppManager.hideApp(AppConstant.GUILD_PANEL);
			if(_currentMap==wczbMap){
				GuildWarSender.reqGuildWarEnter();
			}else{
				GuildWarSender.reqGuildWarEnter(1);
			}
		}
	}
}