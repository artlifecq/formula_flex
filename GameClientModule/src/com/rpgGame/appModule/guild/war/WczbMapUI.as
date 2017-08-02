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
	
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.ds.HashMap;
	import org.mokylin.skin.app.banghui.wangcheng.Cont_WangCheng;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengInfo_Item;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang;
	
	import starling.display.DisplayObject;
	
	/**
	 * 王城争霸地图
	 * @author dik
	 * 2017-7-26
	 */
	public class WczbMapUI extends GuildWarMapUI
	{
		private var _skin:Cont_WangCheng;
		
		private var _rewardMap:HashMap;//奖励
		private var _cityIcon:HashMap;//城池
		private var _nameMap:HashMap;//拥有名称
		private var _tipsDataMap:HashMap;//tips
		
		private var cityHold:UIAsset;
		private var baoXiang:UIAsset;
		
		private var wangChengNames:Array=["handan","daliang","chengdu","linzi"];
		private var wczb_citys:Array=[EnumCity.XI_WEI,EnumCity.DONG_WEI,EnumCity.ZHONG_WEI,EnumCity.WANG_CHENG];
		
		public function WczbMapUI()
		{
			_skin=new Cont_WangCheng();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
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
			
			_tipsDataMap=new HashMap();
			_tipsDataMap.add(EnumCity.WANG_CHENG,new DynamicTipData());
			_tipsDataMap.add(EnumCity.XI_WEI,new DynamicTipData());
			_tipsDataMap.add(EnumCity.ZHONG_WEI,new DynamicTipData());
			_tipsDataMap.add(EnumCity.DONG_WEI,new DynamicTipData());
		}
		
		private function initCity(city:int):void
		{
			var bao:WangCheng_BaoXiang=_rewardMap.getValue(city);
			bao.uiLingQu.visible=bao.uiBaoXiang.visible=false;
		}
		
		override public function refresh() : void
		{
			initCity(EnumCity.WANG_CHENG);
			initCity(EnumCity.XI_WEI);
			initCity(EnumCity.ZHONG_WEI);
			initCity(EnumCity.DONG_WEI);
			
			initEvent();
		}
		
		private function initEvent():void
		{
			TipTargetManager.show( _skin.grpWangCheng, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.WANG_CHENG)));
			TipTargetManager.show( _skin.grpCheng1, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.XI_WEI)));
			TipTargetManager.show( _skin.grpCheng2, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.ZHONG_WEI)));
			TipTargetManager.show( _skin.grpCheng3, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsDataMap.getValue(EnumCity.DONG_WEI)));
		}
		
		override protected function onHide():void
		{
			super.onHide();
			TipTargetManager.remove( _skin.grpWangCheng);
			TipTargetManager.remove( _skin.grpCheng1);
			TipTargetManager.remove( _skin.grpCheng2);
			TipTargetManager.remove( _skin.grpCheng3);
		}
		
		private function setGetReward(city:int,state:Boolean):void
		{
			var sk:WangCheng_BaoXiang=_rewardMap.getValue(city);
			sk.uiLingQu.visible=state;
			sk.uiBaoXiang.visible=!state;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case cityHold:
				case baoXiang:
					if(_msg.haveDailyGift==1){
						GuildWarSender.reqGuildWarGiveDailyGift();
					}
					break;
			}
		}
		
		override public function setCityData(msg:ResGuildWarCityInfoMessage):void
		{
			super.setCityData(msg);
			showCityState();
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
				if(info.occupyGuildId.hexValue==myGuildId){
					tipsData.isOwner=true;
				}
			}
			
		}
		
		private function showCityState():void
		{
			var citys:Array=_cityData.getValues();
			var myGuildId:String;
			if(GuildManager.instance().guildData){
				myGuildId=GuildManager.instance().guildData.id.hexValue;
			}
			for each(var cityInfo:GuildWarCityInfo  in citys){
				if(wczb_citys.indexOf(cityInfo.id)==-1){//不是王城争霸的城池
					continue;
				}
				
				if(cityInfo.id==EnumCity.WANG_CHENG){
					var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(cityInfo.areaId);
					_skin.uiFlag.styleName="ui/app/banghui/wangcheng/"+wangChengNames[cfg.q_id-1]+".png";
				}
				
				if(cityInfo.occupyGuildId.hexValue==myGuildId){//是自己的城
					cityHold=_cityIcon.getValue(cityInfo.id);
					baoXiang=_rewardMap.getValue(cityInfo.id).uiBaoXiang;
					if(_msg.haveDailyGift!=-1){
						setGetReward(cityInfo.id,_msg.haveDailyGift==0);
					}
				}
				setGetNameData(cityInfo.id,_cityData.getValue(cityInfo.id));
			}
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
					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"[占]");
					htmlStr+=HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,info.occupyGuildName);
				}
				nm.lbTxt.htmlText=htmlStr;
			}
			nm.bg.height=nm.lbTxt.textHeight+5;
			nm.container.y=_cityIcon.getValue(city).y-nm.bg.height;
		}
	}
}