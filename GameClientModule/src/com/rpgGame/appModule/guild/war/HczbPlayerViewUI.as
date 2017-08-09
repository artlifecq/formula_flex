package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.cmdlistener.enum.EGuildMemberType;
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.QSinglecitybaseCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.clientConfig.Q_singlecitybase;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guildWar.bean.GuildAvatarInfo;
	import com.rpgGame.netData.guildWar.message.G2CRespKingGuidWarAvatarInfoMessage;
	
	import feathers.controls.SkinnableContainer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengZhengBa;
	
	import starling.display.DisplayObject;
	
	/**
	 * 皇城争霸帮众信息
	 * @author dik
	 * 
	 */
	public class HczbPlayerViewUI extends ViewUI
	{
		private var _skin:WangChengZhengBa;
		private var headIcons:Array=["3","2","1","2","3"];
		private var memberSeat:Array=[EGuildMemberType.LEADER,EGuildMemberType.DEPUTY_CHIEF,EGuildMemberType.CHIEF,EGuildMemberType.DEPUTY_CHIEF,EGuildMemberType.LEADER];
		
		
		private var headList:Vector.<WangChengHead_Item>;
		private var xuweiList:Vector.<SkinnableContainer>;
		private var roleList:Vector.<UIAvatar3D>;
		private var leaderNum:int;
		private var deputyNum:int;
		private var rewardGrp:RewardGroup;
		
		public function HczbPlayerViewUI()
		{
			_skin=new WangChengZhengBa();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			headList=new Vector.<WangChengHead_Item>();
			roleList=new Vector.<UIAvatar3D>();
			var index:int;
			xuweiList=new Vector.<SkinnableContainer>();
			for(var i:int=1;i<6;i++){
				headList.push(_skin["head"+i].skin);
				index=i-1;
				headList[index].uiHead.styleName="ui/app/zhanchang/weicheng/"+headIcons[index]+".png";
				headList[index].lbName.text="";
				roleList.push(new UIAvatar3D(_skin["playerGrp"+i],1.7));
				xuweiList.push(_skin["xuwei"+i]);
				xuweiList[index].visible=true;
			}
			
			rewardGrp=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1);
			var cfg:Q_singlecitybase=QSinglecitybaseCfgData.getCityCfg(EnumCity.HUANG_CHENG);
			rewardGrp.setRewardByJsonStr(cfg.q_rewards3);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.cityImg&&_skin.uiBaoXiang.visible){
				_skin.uiBaoXiang.visible=false;
				_skin.uiLingQu.visible=true;
				GuildWarSender.reqGuildWarGiveDailyGift(1);
			}else if(target==_skin.lbJiangli){
				AppManager.showApp(AppConstant.GUILD_HCZB_REWARD,null,"",this._skin.container);
			}else if(target==_skin.toZhanChang){
				GuildWarSender.reqGuildWarEnter(1);
			}
		}
		
		override public function show(data:Object=null):void
		{
			initEvent();
			GuildWarSender.reqHCZBPlayerInfos();
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(GuildEvent.GUILD_HCZB_AVATAR_LIST,onGetInfos);
			TipTargetManager.show( _skin.btnShuoMing,TargetTipsMaker.makeSimpleTextTips( TipsCfgData.getTipsInfo(30).q_describe));
		}
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(GuildEvent.GUILD_HCZB_AVATAR_LIST,onGetInfos);
			TipTargetManager.remove( _skin.btnShuoMing);
		}
		
		private function onGetInfos(msg:G2CRespKingGuidWarAvatarInfoMessage):void
		{
			if(msg.guildName){
				_skin.lbBangName.htmlText=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"[占]")+msg.guildName;
			}else{
				_skin.lbBangName.text="";
			}
			if(msg.haveDailyGift==-1){
				_skin.uiLingQu.visible=_skin.uiBaoXiang.visible=false;
			}else {
				_skin.uiLingQu.visible=msg.haveDailyGift==0;
				_skin.uiBaoXiang.visible=!_skin.uiLingQu.visible;
			}
			
			var info:GuildAvatarInfo;
			var index:int;
			for(var i:int=0;i<msg.avatarInfo.length;i++){
				info=msg.avatarInfo[i];
				xuweiList[i].visible=true;
				if(info.guildMemberType==EGuildMemberType.LEADER){
					leaderNum++;
					if(leaderNum==1){
						index=0;
					}else{
						index=4;
					}
				}else if(info.guildMemberType==EGuildMemberType.DEPUTY_CHIEF){
					deputyNum++;
					if(deputyNum==1){
						index=1;
					}else{
						index=3;
					}
				}else{
					index=2;
				}
				updateAvatarInfo(index,info);
			}
		}
		
		private function updateAvatarInfo(index:int,info:GuildAvatarInfo):void
		{
			headList[index].lbName.text=info.playerName+"["+info.playerLevel+"]";
			roleList[index].updateWithPlayerAppearanceInfo(info.playerAvatarInfo);
			xuweiList[index].visible=false;
		}
	}
}