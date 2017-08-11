package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.QKindomnameCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_kindomname;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.info.tip.WczbTipsData;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guildWar.bean.GuildWarCityInfo;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityInfoMessage;
	
	import flash.geom.Point;
	
	import org.client.mainCore.ds.HashMap;
	import org.mokylin.skin.app.banghui.huangcheng.Cont_HuangCheng;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengInfo_Item;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang;
	
	import starling.display.DisplayObject;
	
	/**
	 * 皇城争霸地图
	 * @author dik
	 * 2017-7-26
	 */
	public class HczbMapUI extends GuildWarMapUI
	{
		private var _skin:Cont_HuangCheng;
		
		private var _tipsDataMap:HashMap;//tips
		private var _cityIcon:HashMap;//城池
		private var _nameMap:HashMap;//拥有名称
		
		private var wczb_citys:Array=[EnumCity.WC_HD,EnumCity.WC_DL,EnumCity.WC_YD,EnumCity.WC_LZ,EnumCity.HUANG_CHENG];
		private var _initNameSeats:HashMap;
		
		public function HczbMapUI()
		{
			_skin=new Cont_HuangCheng();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_cityIcon=new HashMap();
			_cityIcon.add(EnumCity.WC_HD,_skin.uiCh2);
			_cityIcon.add(EnumCity.WC_DL,_skin.uiCh1);
			_cityIcon.add(EnumCity.WC_YD,_skin.uiCh4);
			_cityIcon.add(EnumCity.WC_LZ,_skin.uiCh3);
			_cityIcon.add(EnumCity.HUANG_CHENG,_skin.uiWangCheng);
			
			_nameMap=new HashMap();
			_nameMap.add(EnumCity.WC_HD,_skin.skinName2.skin);
			_nameMap.add(EnumCity.WC_DL,_skin.skinName1.skin);
			_nameMap.add(EnumCity.WC_YD,_skin.skinName4.skin);
			_nameMap.add(EnumCity.WC_LZ,_skin.skinName3.skin);
			_nameMap.add(EnumCity.HUANG_CHENG,_skin.skinName.skin);
			
			_initNameSeats=new HashMap();
			_initNameSeats.add(EnumCity.WC_HD,new Point(_skin.skinName2.x,_skin.skinName2.y+_skin.skinName2.height/2));
			_initNameSeats.add(EnumCity.WC_DL,new Point(_skin.skinName1.x,_skin.skinName1.y+_skin.skinName1.height/2));
			_initNameSeats.add(EnumCity.WC_YD,new Point(_skin.skinName4.x,_skin.skinName4.y+_skin.skinName4.height/2));
			_initNameSeats.add(EnumCity.WC_LZ,new Point(_skin.skinName3.x,_skin.skinName3.y+_skin.skinName3.height/2));
			_initNameSeats.add(EnumCity.HUANG_CHENG,new Point(_skin.skinName.x,_skin.skinName.y+_skin.skinName.height/2));
			
			_tipsDataMap=new HashMap();
			_tipsDataMap.add(EnumCity.WC_HD,new DynamicTipData());
			_tipsDataMap.add(EnumCity.WC_DL,new DynamicTipData());
			_tipsDataMap.add(EnumCity.WC_YD,new DynamicTipData());
			_tipsDataMap.add(EnumCity.WC_LZ,new DynamicTipData());
			_tipsDataMap.add(EnumCity.HUANG_CHENG,new DynamicTipData());
			
			
			initWcTips(EnumCity.WC_HD);
			initWcTips(EnumCity.WC_DL);
			initWcTips(EnumCity.WC_YD);
			initWcTips(EnumCity.WC_LZ);
			initWcTips(EnumCity.HUANG_CHENG);
		}
		
		private function initWcTips(city:int):void
		{
			var tipsData:WczbTipsData=(_tipsDataMap.getValue(city) as DynamicTipData).data;
			if(!tipsData){
				tipsData=new WczbTipsData();
				(_tipsDataMap.getValue(city) as DynamicTipData).data=tipsData;
				var cityInfo:GuildWarCityInfo=new GuildWarCityInfo();
				if(city!=EnumCity.HUANG_CHENG){
					cityInfo.id=EnumCity.WANG_CHENG;
				}else{
					cityInfo.id=city;
				}
				cityInfo.areaId=city;
				tipsData.isOwner=false;
				tipsData.cityInfo=cityInfo;
			}
		}
		
		override public function refresh() : void
		{
			initEvent();
		}
		
		private function initEvent():void
		{
			TipTargetManager.show( _skin.grpCheng2, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.WC_HD)));
			TipTargetManager.show( _skin.grpCheng1, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.WC_DL)));
			TipTargetManager.show( _skin.grpCheng4, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.WC_YD)));
			TipTargetManager.show( _skin.grpCheng3, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.WC_LZ)));
			TipTargetManager.show( _skin.grpWangCheng, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.HUANG_CHENG)));
		}
		
		override protected function onHide():void
		{
			super.onHide();
			TipTargetManager.remove( _skin.grpWangCheng);
			TipTargetManager.remove( _skin.grpCheng1);
			TipTargetManager.remove( _skin.grpCheng2);
			TipTargetManager.remove( _skin.grpCheng3);
			TipTargetManager.remove( _skin.grpCheng4);
		}
		
		override public function setCityData(msg:ResGuildWarCityInfoMessage):void
		{
			super.setCityData(msg);
			showCityState();
			var sk:WangCheng_BaoXiang=_skin.skinBaoXiang.skin as WangCheng_BaoXiang;
			sk.uiLingQu.visible=false;
			sk.uiBaoXiang.visible=false;
			var myGuildId:String;
			if(GuildManager.instance().guildData){
				myGuildId=GuildManager.instance().guildData.id.hexValue;
			}
			for(var i:int=0;i<msg.citys.length;i++){
				var info:GuildWarCityInfo=msg.citys[i];
				var tipsData:WczbTipsData=(_tipsDataMap.getValue(info.id) as DynamicTipData).data;
				if(!tipsData){
					tipsData=new WczbTipsData();
					(_tipsDataMap.getValue(info.id) as DynamicTipData).data=tipsData;
				}
				tipsData.cityInfo=info;
				tipsData.nextTime=msg.nextWarTime*1000;
				tipsData.rewardState=msg.haveDailyGift;
				tipsData.isOwner=false;
				if(info.occupyGuildId.hexValue==myGuildId&&info.id==EnumCity.HUANG_CHENG){
					tipsData.isOwner=true;
				}
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			var sk:WangCheng_BaoXiang=_skin.skinBaoXiang.skin as WangCheng_BaoXiang;
			if(target==_skin.grpWangCheng&&sk.uiBaoXiang.visible){
				GuildWarSender.reqGuildWarGiveDailyGift(1);
			}
		}
		
		private function showCityState():void
		{
			var cityIds:Array=_cityIcon.keys();
			for(var i:int=0;i<cityIds.length;i++){
				setGetNameData(cityIds[i],null)
			}
			
			var citys:Array=_cityData.getValues();
			var myGuildId:String;
			if(GuildManager.instance().guildData){
				myGuildId=GuildManager.instance().guildData.id.hexValue;
			}
			for each(var cityInfo:GuildWarCityInfo  in citys){
				if(wczb_citys.indexOf(cityInfo.id)==-1){//不是王城争霸的城池
					continue;
				}
				if(cityInfo.occupyGuildId.hexValue==myGuildId&&cityInfo.id==EnumCity.HUANG_CHENG){//是自己的城,并且是皇城
					if(_msg.haveDailyGift!=-1){
						setGetReward(_msg.haveDailyGift==0);
					}
				}
				var cityId:int=cityInfo.id;
				if(_msg.cityType==3&&cityId!=EnumCity.HUANG_CHENG){
					var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(cityInfo.areaId);
					cityId=cfg.q_id;
				}
				setGetNameData(cityId,_cityData.getValue(cityId));
			}
		}
		
		private function setGetReward(state:Boolean):void
		{
			var sk:WangCheng_BaoXiang=_skin.skinBaoXiang.skin as WangCheng_BaoXiang;
			sk.uiLingQu.visible=state;
			sk.uiBaoXiang.visible=!state;
		}
		
		private function setGetNameData(city:int,info:GuildWarCityInfo):void
		{
			var nm:WangChengInfo_Item=_nameMap.getValue(city);
			/*info.attackGuildName="帮派名字有七个";
			info.occupyGuildName="帮派名字有七个";
			info.occupyDay=123;
			info.state=3;*/
			
			if(!info||!info.occupyGuildName){
				nm.lbTxt.htmlText="未占领";
				nm.lbTxt.textAlign="center"
			}else{
				var htmlStr:String;
				nm.lbTxt.textAlign="left";
				if(info.attackGuildName&&(info.state==3||info.state==4)){
					htmlStr=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"[占领时间]:");
					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,info.occupyDay+"\n");
					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"[守]");
					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,info.occupyGuildName+"\n");
					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_RED_TEXT,"[攻]");
					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_RED_TEXT,info.attackGuildName);
				}else{
					htmlStr=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"[占领时间]:");
					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,info.occupyDay+"\n");
//					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"[占]");
					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,info.occupyGuildName);
				}
				nm.lbTxt.htmlText=htmlStr;
			}
			nm.bg.height=nm.lbTxt.textHeight+5;
			nm.container.y=_initNameSeats.getValue(city).y-nm.container.height;
			nm.container.x=_initNameSeats.getValue(city).x;
		}
	}
}