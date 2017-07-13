package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.info.tip.WczbTipsData;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guildWar.bean.GuildWarCityInfo;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityInfoMessage;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.UIAsset;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengInfo_Item;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_Skin;
	import org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
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
		
		
		private var _skin:WangCheng_Skin;
		private var _tipsDataMap:HashMap;
		
		private var _rewardMap:HashMap;
		private var _nameMap:HashMap;
		private var _cityIcon:HashMap;
		private var _cityData:HashMap;
		private var city:int;
		private var _infoMsg:ResGuildWarCityInfoMessage;
		private var _leftTime:int;
		private var _timeStr:String;
		private var fightInfo:GuildWarCityInfo;
		private var cityHold:UIAsset;
//		private var applyCityId:int;
		
		public function WczbWarViewUI()
		{
			_skin=new WangCheng_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.List.itemRendererType=WczbGuildFightRankItemRender;
			_skin.List.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
			_skin.List.dataProvider=new ListCollection();
			
			_rewardMap=new HashMap();
			_rewardMap.add(EnumCity.WANG_CHENG,_skin.skinBaoXiang0.skin);
			_rewardMap.add(EnumCity.XI_WEI,_skin.skinBaoXiang1.skin);
			_rewardMap.add(EnumCity.ZHONG_WEI,_skin.skinBaoXiang2.skin);
			_rewardMap.add(EnumCity.DONG_WEI,_skin.skinBaoXiang3.skin);
			
			_cityIcon=new HashMap();
			_cityIcon.add(EnumCity.WANG_CHENG,_skin.uiWangCheng);
			_cityIcon.add(EnumCity.XI_WEI,_skin.uiCh1);
			_cityIcon.add(EnumCity.ZHONG_WEI,_skin.uiCh2);
			_cityIcon.add(EnumCity.DONG_WEI,_skin.uiCh3);
			
			_nameMap=new HashMap();
			_nameMap.add(EnumCity.WANG_CHENG,_skin.skinName.skin);
			_nameMap.add(EnumCity.XI_WEI,_skin.skinName1.skin);
			_nameMap.add(EnumCity.ZHONG_WEI,_skin.skinName2.skin);
			_nameMap.add(EnumCity.DONG_WEI,_skin.skinName3.skin);
			
			_cityData=new HashMap();
			_tipsDataMap=new HashMap();
			_tipsDataMap.add(EnumCity.WANG_CHENG,new DynamicTipData());
			_tipsDataMap.add(EnumCity.XI_WEI,new DynamicTipData());
			_tipsDataMap.add(EnumCity.ZHONG_WEI,new DynamicTipData());
			_tipsDataMap.add(EnumCity.DONG_WEI,new DynamicTipData());
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			initPanel();
			initEvent();
		}
		
		private function initPanel():void
		{
			initCity(EnumCity.WANG_CHENG);
			initCity(EnumCity.XI_WEI);
			initCity(EnumCity.ZHONG_WEI);
			initCity(EnumCity.DONG_WEI);
			_skin.grpTo.visible=false;
		}
		
		private function initCity(city:int):void
		{
			var bao:WangCheng_BaoXiang=_rewardMap.getValue(city);
			bao.uiLingQu.visible=bao.uiBaoXiang.visible=false;
			var nm:ZhengBaVsNameItemSkin=_nameMap.getValue(city);
			var nmItem:WangChengInfo_Item=(nm.guild0.skin as WangChengInfo_Item);
			nmItem.lbBangName.text=nmItem.lbZhan.text="";
			nmItem=(nm.guild1.skin as WangChengInfo_Item);
			nmItem.lbBangName.text=nmItem.lbZhan.text="";
			nm.guild0.visible=nm.guild1.visible=false;
		}
		
		/**
		 *设置奖励获取状态 
		 * @param city
		 * @param state
		 * 
		 */
		private function setGetReward(city:int,state:Boolean):void
		{
			var sk:WangCheng_BaoXiang=_rewardMap.getValue(city);
			sk.uiLingQu.visible=state;
			sk.uiBaoXiang.visible=!state;
		}
		
		private function initEvent():void
		{
			TipTargetManager.show( _skin.grpWangCheng, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.WANG_CHENG)));
			TipTargetManager.show( _skin.grpCheng1, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.XI_WEI)));
			TipTargetManager.show( _skin.grpCheng2, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.ZHONG_WEI)));
			TipTargetManager.show( _skin.grpCheng3, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.DONG_WEI)));
			EventManager.addEvent(GuildEvent.GUILD_WCZB_INFO,updatePanelView);
			TipTargetManager.show( _skin.btnShuoMing,TargetTipsMaker.makeSimpleTextTips( TipsCfgData.getTipsInfo(30).q_describe));
			EventManager.addEvent(GuildEvent.GUILD_CHANGE_ACTIVE,updateAct);
			GuildWarSender.reqGuildWarCityInfo();
			GuildWarSender.reqEnterGuildWarPanel();
		}
		
		private function updateAct(value:int):void
		{
			_skin.lbHuoYue.text=value.toString();
		}
		
		private function updatePanelView(msg:ResGuildWarCityInfoMessage):void
		{
			var _citys:Vector.<GuildWarCityInfo>=msg.citys;
			var num:int=_citys.length;
			var i:int=0,info:GuildWarCityInfo;
			var myGuildId:String;
			if(GuildManager.instance().haveGuild){
				myGuildId=GuildManager.instance().guildData.id.hexValue;
			}
			
			var state:int=UNAPPLY_STATE;
			_infoMsg=msg;
			cityHold=null;
			var nextTime:int=_infoMsg.nextWarTime*1000;
			for(i=0;i<num;i++){
				info=_citys[i];
				_cityData.add(info.id,info);
				var tipsData:WczbTipsData=(_tipsDataMap.getValue(info.id) as DynamicTipData).data;
				if(!tipsData){
					tipsData=new WczbTipsData();
					(_tipsDataMap.getValue(info.id) as DynamicTipData).data=tipsData;
				}
				tipsData.cityInfo=info;
				tipsData.nextTime=nextTime;
				tipsData.rewardState=_infoMsg.haveDailyGift;
				tipsData.isOwner=false;
				if(info.id==EnumCity.WANG_CHENG&&info.state!=1&&info.state!=5){//是王城
					if(info.state==3){
						state=PRE_WAR_WC;
						fightInfo=info;
					}else if(info.state==4){
						state=WAR_WC;
						fightInfo=info;
					}
				}else{
					var result:int=getCityStateForData(info,myGuildId);
					state=result!=-1?result:state;
					if(state==DEF_STATE||state==HOLD_STATE){
						cityHold=_cityIcon.getValue(fightInfo.id);
						tipsData.isOwner=true;
					}
				}
			}
			if(!fightInfo){
				if(msg.applyCityId==-1){
					city=-1;
					if(GuildManager.instance().haveGuild){
						state=UNAPPLY_STATE;
					}else{
						state=UNGUILD_STATE;
					}
				}else{
					state=APPLYING_STATE;
					city=msg.applyCityId;
				}
			}else{
				city=fightInfo.id;
			}
			
			showZhanshi(state);
			showRank();
			showCityState();
			_skin.lbHuoYue.text=_infoMsg.guildActive.toString();
			if(_infoMsg.nextWarTime!=0){
				_skin.nextTitle.text="下次开战时间:";
				_skin.lbDate.text=TimeUtil.changeDateToDateStr(new Date(nextTime));
			}else{
				_skin.lbDate.text="";
				_skin.nextTitle.text="";
			}
		}
		
		private function getCityStateForData(info:GuildWarCityInfo,myGuildId:String):int
		{
			if(!info.occupyGuildId&&!info.attackGuildId){//进攻方和防守方都没有那就是空城
				return -1;
			}
			if(info.attackGuildId.hexValue!=myGuildId&&info.attackGuildId.hexValue!=myGuildId){//攻方不是自己守方不是自己
				return -1;
			}
			var result:int=1;
			fightInfo=info;
			switch(info.state){
				case 1:
					result=UNAPPLY_STATE;
					break;
				case 2:
					result=APPLYING_STATE;
					break;
				case 3:
					result=PRE_WAR_STATE;
					break;
				case 4:
					if(info.occupyGuildId.hexValue==myGuildId){//防守
						result=DEF_STATE;
					}else if(info.attackGuildId.hexValue==myGuildId){//攻击
						result=ATTACK_STATE;
					}
					break;
				case 5:
					if(info.attackGuildId.hexValue==myGuildId){//自己占领
						result=HOLD_STATE;
					}
					break;
			}
			return result;
		}
		
		private function showCityState():void
		{
			var citys:Array=_cityData.getValues();
			var myGuildId:String;
			if(GuildManager.instance().guildData){
				myGuildId=GuildManager.instance().guildData.id.hexValue;
			}
			for each(var cityInfo:GuildWarCityInfo  in citys){
				if(cityInfo.occupyGuildId.hexValue==myGuildId){//是自己的城
					if(_infoMsg.haveDailyGift!=-1){
						setGetReward(cityInfo.id,_infoMsg.haveDailyGift==0);
					}
				}
				setGetNameData(cityInfo.id,_cityData.getValue(cityInfo.id));
			}
		}
		
		private function setGetNameData(city:int,info:GuildWarCityInfo):void
		{
			var nm:ZhengBaVsNameItemSkin=_nameMap.getValue(city);
			var nmItem:WangChengInfo_Item=(nm.guild0.skin as WangChengInfo_Item);
			nm.guild0.visible=nm.guild1.visible=false;
			if(!info||!info.occupyGuildName){
				nm.guild0.visible=true;
				nmItem.lbBangName.text="未占领";
				nmItem.lbZhan.text="";
			}else{
				if(info.attackGuildName){
					nm.guild0.visible=nm.guild1.visible=true;
					nmItem.lbBangName.text=info.occupyGuildName;
					nmItem.lbZhan.text="守";
					nmItem=(nm.guild1.skin as WangChengInfo_Item);
					nmItem.lbBangName.text=info.attackGuildName;
					nmItem.lbZhan.text="攻";
				}else{
					nm.guild0.visible=true;
					nmItem.lbBangName.text=info.occupyGuildName;
					nmItem.lbZhan.text="占";
				}
			}
		}
		
		private function showRank():void
		{
			_skin.List.dataProvider.removeAll();
			var num:int=_infoMsg.ranks.length;
			for(var i:int=0;i<num;i++){
				_skin.List.dataProvider.addItem(_infoMsg.ranks[i]);
			}
		}
		
		private function showZhanshi(state:int):void
		{
			_skin.btnBaoming.touchable=true;
			_skin.btnBaoming.filter=null;
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
				default:
					break;
			}
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
			TimerServer.addLoop(updateTime,1000);
			
			var cityStyleName:String="wangcheng3";
			var flagStyleName:String="wangcheng";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
			_skin.uiCheng.x=100;
			_skin.uiMyFlag.x=128;
			_skin.btnBaoming.touchable=false;
			_skin.btnBaoming.filter=FilterUtil.getGrayFilter();
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
			TimerServer.addLoop(updateTime,1000);
			
			_skin.uiCheng.x=100;
			_skin.uiMyFlag.x=128;
			
			var cityStyleName:String="wangcheng3";
			var flagStyleName:String="wangcheng";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
			_skin.btnBaoming.touchable=false;
			_skin.btnBaoming.filter=FilterUtil.getGrayFilter();
		}
		
		private function preWarState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="准备进攻"+getCityName(city);
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,fightInfo.attackGuildName);
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW,"VS");
			_skin.lbName2.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,fightInfo.occupyGuildName);
			
			_timeStr="距离战斗开始还有:"
			_leftTime=_infoMsg.curWarTime;
			TimerServer.addLoop(updateTime,1000);
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			switch(city){
				case EnumCity.XI_WEI:
					cityStyleName="weicheng1";
					flagStyleName="xiwei";
					break;
				case EnumCity.ZHONG_WEI:
					cityStyleName="weicheng2";
					flagStyleName="zhongwei";
					break;
				case EnumCity.DONG_WEI:
					cityStyleName="weicheng3";
					flagStyleName="dongwei";
					break;
			}
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";			
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
			_skin.lbHead.htmlText="占领"+getCityName(city);
			_skin.lbName1.htmlText="";
			_skin.lbName2.htmlText="";
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,"本帮已占领"+fightInfo.occupyGuildName);
			_skin.lbTime.text="";
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			switch(city){
				case EnumCity.XI_WEI:
					cityStyleName="weicheng1";
					flagStyleName="xiwei";
					break;
				case EnumCity.ZHONG_WEI:
					cityStyleName="weicheng2";
					flagStyleName="zhongwei";
					break;
				case EnumCity.DONG_WEI:
					cityStyleName="weicheng3";
					flagStyleName="dongwei";
					break;
			}
			
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function defState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="防守"+getCityName(city);
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,fightInfo.attackGuildName);
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW,"VS");
			_skin.lbName2.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,fightInfo.occupyGuildName);
			_timeStr="距离战斗结束还有:"
			_leftTime=_infoMsg.curWarTime;
			TimerServer.addLoop(updateTime,1000);
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			switch(city){
				case EnumCity.XI_WEI:
					cityStyleName="weicheng1";
					flagStyleName="xiwei";
					break;
				case EnumCity.ZHONG_WEI:
					cityStyleName="weicheng2";
					flagStyleName="zhongwei";
					break;
				case EnumCity.DONG_WEI:
					cityStyleName="weicheng3";
					flagStyleName="dongwei";
					break;
			}
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function attackState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="进攻"+getCityName(city);
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,fightInfo.attackGuildName);
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW,"VS");
			_skin.lbName2.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,fightInfo.occupyGuildName);
			
			_timeStr="距离战斗结束还有:"
			_leftTime=_infoMsg.curWarTime;
			TimerServer.addLoop(updateTime,1000);
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			switch(city){
				case EnumCity.XI_WEI:
					cityStyleName="weicheng1";
					flagStyleName="xiwei";
					break;
				case EnumCity.ZHONG_WEI:
					cityStyleName="weicheng2";
					flagStyleName="zhongwei";
					break;
				case EnumCity.DONG_WEI:
					cityStyleName="weicheng3";
					flagStyleName="dongwei";
					break;
			}
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function getCityName(city):String
		{
			var name:String="";
			switch(city){
				case EnumCity.XI_WEI:
					name="西卫";
					break;
				case EnumCity.ZHONG_WEI:
					name="中卫";
					break;
				case EnumCity.DONG_WEI:
					name="东卫";
					break;
			}
			return name;
		}
		
		private function applying():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="竞拍"+getCityName(city);
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW1,"当前出价最高帮派:");
			if(_infoMsg.curMaxPriceGuildName){
				_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,_infoMsg.curMaxPriceGuildName);
			}else{
				_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,"暂无");
			}
			_skin.lbName2.htmlText="";
			_leftTime=_infoMsg.curWarTime;
			_timeStr="距离竞拍结束还剩:"
			TimerServer.addLoop(updateTime,1000);
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			switch(city){
				case EnumCity.XI_WEI:
					cityStyleName="weicheng1";
					flagStyleName="xiwei";
					break;
				case EnumCity.ZHONG_WEI:
					cityStyleName="weicheng2";
					flagStyleName="zhongwei";
					break;
				case EnumCity.DONG_WEI:
					cityStyleName="weicheng3";
					flagStyleName="dongwei";
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
				TimerServer.remove(updateTime);
				GuildWarSender.reqGuildWarCityInfo();//重新获取城池信息
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
		
		override public function hide():void
		{
			super.hide();
			TipTargetManager.remove( _skin.grpWangCheng);
			TipTargetManager.remove( _skin.grpCheng1);
			TipTargetManager.remove( _skin.grpCheng2);
			TipTargetManager.remove( _skin.grpCheng3);
			TipTargetManager.remove( _skin.btnShuoMing);
			EventManager.removeEvent(GuildEvent.GUILD_WCZB_INFO,updatePanelView);
			EventManager.removeEvent(GuildEvent.GUILD_CHANGE_ACTIVE,updateAct);
			TimerServer.remove(updateTime);
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
					AppManager.showApp(AppConstant.GUILD_WCZB_APPLY,null,"",this._skin.container);
					break;
				case _skin.btnJiangli:
					AppManager.showApp(AppConstant.GUILD_WCZB_REWARD,null,"",this._skin.container);
					break;
				case _skin.btnJinru:
					toEnterWar();
					break;
				case cityHold:
					GuildWarSender.reqGuildWarGiveDailyGift();
					break;
				case _skin.btnJone:
					AppManager.showAppNoHide(AppConstant.GUILD_PANEL,null,EmFunctionID.EM_BANGHUI_LIEBIAO);
					break;
			}
		}
		
		private function toEnterWar():void
		{
			AppManager.closeAllApp();
			GuildWarSender.reqGuildWarEnter();
		}
	}
}