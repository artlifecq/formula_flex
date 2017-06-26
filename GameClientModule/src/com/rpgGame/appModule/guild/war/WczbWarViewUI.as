package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guildWar.bean.GuildWarCityInfo;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityInfoMessage;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_Skin;
	import org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengInfo_Item;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	/**
	 *王城争霸战 
	 * @author dik
	 * 
	 */
	public class WczbWarViewUI extends ViewUI
	{
		private var _skin:WangCheng_Skin;
		private var _tipsData1:DynamicTipData;
		private var _tipsData2:DynamicTipData;
		private var _tipsData3:DynamicTipData;
		private var _tipsData4:DynamicTipData;
		
		private var _rewardMap:HashMap;
		private var _nameMap:HashMap;
		private var _cityData:HashMap;
		private var city:int;
		private var _infoMsg:ResGuildWarCityInfoMessage;
		private var _leftTime:int;
		private var _timeStr:String;
		private var fightInfo:GuildWarCityInfo;
		
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
			
			_nameMap=new HashMap();
			_nameMap.add(EnumCity.WANG_CHENG,_skin.skinName.skin);
			_nameMap.add(EnumCity.XI_WEI,_skin.skinName1.skin);
			_nameMap.add(EnumCity.ZHONG_WEI,_skin.skinName2.skin);
			_nameMap.add(EnumCity.DONG_WEI,_skin.skinName3.skin);
			
			_cityData=new HashMap();
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
			_tipsData1=new DynamicTipData();
			_tipsData2=new DynamicTipData();
			_tipsData3=new DynamicTipData();
			_tipsData4=new DynamicTipData();
			TipTargetManager.show( _skin.grpWangCheng, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsData1));
			TipTargetManager.show( _skin.grpCheng1, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsData2));
			TipTargetManager.show( _skin.grpCheng2, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsData3));
			TipTargetManager.show( _skin.grpCheng3, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsData4));
			EventManager.addEvent(GuildEvent.GUILD_WCZB_INFO,updatePanelView);
		}
		
		private function updatePanelView(msg:ResGuildWarCityInfoMessage):void
		{
			var _citys:Vector.<GuildWarCityInfo>=msg.citys;
			var num:int=_citys.length;
			var i:int=0,info:GuildWarCityInfo;
			var myGuildId:String=GuildManager.instance().guildData.id.hexValue;
			
			var state:int=1;
			_infoMsg=msg;
			
			for(i=0;i<num;i++){
				info=_citys[i];
				_cityData.add(info.id,info);
				if(info.occupyGuildId&&info.attackGuildId){//战斗中
					if(info.occupyGuildId.hexValue==myGuildId){//自己是防守方
						fightInfo=info;
						state=4;
					}else if(info.attackGuildId.hexValue==myGuildId){//自己是攻击方
						fightInfo=info;
						state=3;
					}
				}else{
					if(info.attackGuildId.hexValue==myGuildId){//自己是攻击方
						fightInfo=info;
						state=5;
					}
				}
			}
			
			if(!fightInfo){
				if(msg.applyCityId==-1){
					state=1;
					city=-1;
				}else{
					state=2;
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
				_skin.lbDate.text=TimeUtil.changeDateToDateStr(new Date(_infoMsg.nextWarTime*1000));
			}else{
				_skin.lbDate.text="";
			}
		}
		
		private function showCityState():void
		{
			var citys:Array=_cityData.keys();
			var myGuildId:String=GuildManager.instance().guildData.id.hexValue;
			var holdCity:Boolean=fightInfo.occupyGuildId.hexValue==myGuildId;
			for each(var id:int in citys){
				if(id==city&&holdCity){//是自己的城
					if(_infoMsg.haveDailyGift!=-1){
						setGetReward(city,_infoMsg.haveDailyGift==0);
					}
				}
				setGetNameData(id,_cityData.getValue(id));
			}
		}
		
		private function setGetNameData(city:int,info:GuildWarCityInfo):void
		{
			var nm:ZhengBaVsNameItemSkin=_nameMap.getValue(city);
			var nmItem:WangChengInfo_Item=(nm.guild0.skin as WangChengInfo_Item);
			if(!info){
				nmItem.lbBangName.text="未占领";
				nmItem.lbZhan.text="";
			}else{
				if(info.attackGuildName){
					nmItem.lbBangName.text=info.occupyGuildName;
					nmItem.lbZhan.text="守";
					nmItem=(nm.guild1.skin as WangChengInfo_Item);
					nmItem.lbBangName.text=info.attackGuildName;
					nmItem.lbZhan.text="攻";
				}else{
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
				_skin.List.dataProvider.addItem(_infoMsg[i]);
			}
		}
		
		private function showZhanshi(state:int):void
		{
			switch(state){
				case 1:
					unApply();
					break;
				case 2:
					applying();
					break;
				case 3:
					attackState();
					break;
				case 4:
					defState();
					break;
				case 5:
					holdState();
					break;
				default:
					break;
			}
		}
		
		private function holdState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="占领"+city;
			_skin.lbName1.htmlText="";
			_skin.lbName2.htmlText="";
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,"本帮已占领"+fightInfo.occupyGuildName);
			_skin.lbTime.text="";
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function defState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="防守"+city;
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,fightInfo.attackGuildName);
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW,"VS");
			_skin.lbName2.text=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,fightInfo.occupyGuildName);
			_timeStr="距离战斗结束还有:"
			_leftTime=_infoMsg.curWarTime;
			TimerServer.addLoop(updateTime,1000);
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function attackState():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="进攻"+city;
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,fightInfo.attackGuildName);
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW,"VS");
			_skin.lbName2.text=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,fightInfo.occupyGuildName);
			
			_timeStr="距离战斗结束还有:"
			_leftTime=_infoMsg.curWarTime;
			TimerServer.addLoop(updateTime,1000);
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function applying():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="竞拍"+city;
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW1,"当前出价最高帮派:");
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,_infoMsg.curMaxPriceGuildName);
			_skin.lbName2.text="";
			_leftTime=_infoMsg.curWarTime;
			_timeStr="距离竞拍结束还剩:"
			TimerServer.addLoop(updateTime,1000);
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function updateTime():void
		{
			_leftTime--;
			_skin.lbTime.text=_timeStr+TimeUtil.format3TimeType(_leftTime);
			if(_leftTime<=0){
				TimerServer.remove(updateTime);
			}
		}
		
		private function unApply():void
		{
			_skin.grpTo.visible=true;
			_skin.grpCheng.visible=false;
			_skin.lbHead.htmlText="";
		}
		
		override public function hide():void
		{
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnBaoming:
					AppManager.showApp(AppConstant.GUILD_WCZB_APPLY,null,"",this._skin.container);
					break;
				case _skin.btnInfo:
					AppManager.showApp(AppConstant.GUILD_WCZB_HISTORY,null,"",this._skin.container);
					break;
				case _skin.btnJiangli:
					AppManager.showApp(AppConstant.GUILD_WCZB_REWARD,null,"",this._skin.container);
					break;
				case _skin.btnJinru:
					break;
			}
		}
	}
}