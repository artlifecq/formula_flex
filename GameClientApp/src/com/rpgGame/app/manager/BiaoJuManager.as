package com.rpgGame.app.manager
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.BiaoJuSender;
	import com.rpgGame.app.sender.NpcSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.BiaoJuEvent;
	import com.rpgGame.coreData.info.biaoju.BiaoJuData;
	import com.rpgGame.coreData.info.biaoju.BiaoJuOfficeData;
	import com.rpgGame.coreData.info.country.CountryGovernmentPostData;
	import com.rpgGame.coreData.info.country.country.CountryOfficeData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.role.BiaoCheData;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import app.message.AllBiaoJuLogProto;
	import app.message.AmountType;
	import app.message.BiaoJuMiscDataProto;
	import app.message.BiaoJuProto;
	import app.message.BiaoJuLogProto.BiaoJuLogType;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	import utils.TimerServer;

	public class BiaoJuManager
	{
		public function BiaoJuManager()
		{
		}
		/**当前记录显示类型**/
		private static const TOTAL_TYPES : Array = [];
		/**历史记录显示类型**/
		private static const ACCUM_TYPES : Array = [];
		public static var biaoJu : BiaoJuData;
		public static var isOpen : Boolean;
		public static var openTime : Number;
		public static var closeTime : Number;
		public static var biaoJuLog : Array;
		public static var miscData : BiaoJuMiscDataProto;
		public static function setUp(data:BiaoJuProto):void
		{
			biaoJu = new BiaoJuData();
			biaoJu.setData(data);
			EventManager.dispatchEvent(BiaoJuEvent.BIAO_JU_DATA_INIT);
		}
		
		public static function setMiscData(data : BiaoJuMiscDataProto):void
		{
			miscData = data;
		}
		/**运营资金**/
		public static function get runningMoney():Number
		{
			return biaoJu.total_money - biaoJu.tou_bao_money * miscData.touBaoReparationMultiple / 100
		}
		/**赔偿能力**/
		public static function get compensate():Number
		{
			return runningMoney / biaoJu.total_money;
		}
		
		/**镖局log**/
		public static function setbiaoJuLog(data:AllBiaoJuLogProto):void
		{
			biaoJuLog = data.datas;
			EventManager.dispatchEvent(BiaoJuEvent.BIAO_JU_LOG);
		}
		/**
		 * 镖局每日重置
		 */
		public static function biaoJuResetDaily():void
		{
			
		}
		
		public static function getBiaoJuBaseData():void
		{
			if(!GuildManager.haveGuild)
			{
				NoticeManager.showNotify("您没有帮派，无法查看镖局信息");
				return;
			}
			
			if(!CountryManager.getSelfOffice())
			{
				NoticeManager.showNotify("您不是官员或者禁卫军，无法查看镖局信息");
				return;
			}
			
			if(CountryManager.getSelfIsKing())
			{
				BiaoJuSender.getBiaoJuData();
			}else
			{
				NpcSender.clickNpc(openPanelNpcId, openPanelIndex);
			}
		}
		private static var openPanelNpcId:Number;
		private static var openPanelIndex:Number;
		public static function showBiaoJuPanel(npcId:Number,index:int):void
		{
			if(!GuildManager.haveGuild)
			{
				NoticeManager.showNotify("您没有帮派，无法查看镖局信息");
				return;
			}
			
//			if(CountryManager.getKingGuildName() != GuildManager.guildData.name)
//			{
//				NoticeManager.showNotify("您的帮派不是王帮，无法查看镖局信息");
//				return;
//			}
			
			if(!CountryManager.getSelfOffice())
			{
				NoticeManager.showNotify("您不是官员或者禁卫军，无法查看镖局信息");
				return;
			}
			openPanelNpcId = npcId;
			openPanelIndex = index;
			AppManager.showAppNoHide(AppConstant.BIAO_JU_PANEL);
		}
		
		public static function onScenetHaveTouBao(id:Number):void
		{
			var atkor : SceneRole = SceneManager.getSceneObjByID(id) as SceneRole;
			if( atkor != null )
			{
				var biaoCheData:BiaoCheData = atkor.data as BiaoCheData;
				if( biaoCheData != null )
					biaoCheData.isTouBao = true;
			}
			if(atkor && atkor.headFace is HeadFace)
				(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.BIAO_JU, RenderUnitType.SCRIPTURES, EffectUrl.BIAO_JU_EFFECT);
			
		}
		/**确定投保**/
		public static function sureTouBao():void
		{
			var biaoche : BiaoCheData = MainRoleManager.actorInfo.biaoCheData;
			if(!biaoche)
			{
				NoticeManager.showNotify("您没有镖车，无法投保");
				return;
			}
			if(biaoche.isBroken)
			{
				NoticeManager.showNotify("镖车已经破损，无法投保");
				return;
			}
			if(MainRoleManager.actorInfo.amountInfo.getAmountByType(AmountType.MONEY)<(biaoche.useSilver * miscData.touBaoYaJinPercent * 0.01))
			{
				NoticeManager.showNotify("银两不足，无法投保");
				return;
			}
			NpcSender.clickNpc(toubaoNpc, toubaoIndex);
		}
		private static var toubaoNpc : Number;
		private static var toubaoIndex:int;
		public static function showTouBaoPanel(npcId:Number,index:int):void
		{
			toubaoNpc = npcId;
			toubaoIndex = index;
			var biaoche : BiaoCheData = MainRoleManager.actorInfo.biaoCheData;
			if(!biaoche)
			{
				NoticeManager.showNotify("您没有镖车，无法投保");
				return;
			}
			AppManager.showAppNoHide(AppConstant.BIAO_JU_TOU_BAO_PANEL);
		}
		
		//---------------------------分配
		private static var biaojuOffices:HashMap = new HashMap();
		/**确定分配**/
		public static function sureFenPei():void
		{
			if(!biaoJu)
				return;
			if(!CountryManager.getSelfIsKing())
			{
				GameAlert.showAlertUtil(LangAlertInfo.biaoJuFenPeiError1);
				return;
			}
			if(getFenPeiSilver() > biaoJu.profit)
			{
				GameAlert.showAlertUtil(LangAlertInfo.biaoJuFenPeiError2);
				return;
			}
			if(getFenPeiSilver() == 0)
			{
				GameAlert.showAlertUtil(LangAlertInfo.biaoJuFenPeiError3);
				return;
			}
			if(biaoJu.today_allocate_salary)
			{
				NoticeManager.showNotify("今天已经分配过薪水了");
				return;
			}
			BiaoJuSender.fenPeiSilver(sortOnOffice());
		}
		/**自动分配**/
		public static function autoFenPeiSilver():void
		{
			if(!biaoJu)
				return;
			var numb : int = biaojuOffices.length;
			var onceOffice : int = Math.floor(biaoJu.profit / numb);
			for each(var biaoju : BiaoJuOfficeData in biaojuOffices.getValues())
			{
				if(biaoju.id)
					biaoju.silver = onceOffice;
			}
			EventManager.dispatchEvent(BiaoJuEvent.BIAO_JU_AUTO_FEN_PEI);
		}
		/**单人分配有改变了**/
		public static function fenPeiSilverToPos(id:int,silver:Number):void
		{
			var biaoju : BiaoJuOfficeData = biaojuOffices.getValue(id);
			if(!biaoju)
				return;
			biaoju.silver = silver;
			EventManager.dispatchEvent(BiaoJuEvent.BIAO_JU_FEN_PEI_ALL_SILVER_CHANGE);
		}
		/**获取所有的分配的资金**/
		public static function getFenPeiSilver():Number
		{
			var result : int = 0;
			for each(var biaoju : BiaoJuOfficeData in biaojuOffices.getValues())
			{
				if(biaoju.silver<=0)
					continue;
				result += biaoju.silver;
			}
			return result;
		}
		/**获取分配的列表**/
		public static function getFenPeiList():Array
		{
			if(!CountryManager.selfCountryData || !CountryManager.selfCountryData.officeData)
				return [];
			biaojuOffices.clear();
			var office : CountryOfficeData = CountryManager.selfCountryData.officeData;
			var postData : CountryGovernmentPostData;
			var biaoju : BiaoJuOfficeData;
			for each(postData in office.getAllOffice())
			{			
				if(!postData || !postData.playerName || !postData.id)
					continue;
				biaoju = new BiaoJuOfficeData();
				biaoju.setup(postData);
				biaojuOffices.add(biaoju.id,biaoju);
			}
			return sortOnOffice();
		}
		public static function sortOnOffice():Array
		{
			var resut : Array = biaojuOffices.getValues();
			if(resut.length == 0)
				return resut;
			resut.sortOn(["governmentPost"], [Array.NUMERIC]);
			return resut;
		}
		//----------------------------充入本金
		
		public static function rechargeBiaoJuMoney(money:int):void
		{
			if(money > MainRoleManager.actorInfo.amountInfo.getAmountByType(AmountType.MONEY))
			{
				NoticeManager.showNotify("您身上没有这么多银两");
				return;
			}
			BiaoJuSender.rechargeBiaoJuMoney(money);
		}
		
		/**充钱成功了**/
		public static function rechargeMoney(money:Number):void
		{
			var rechargeMoney : int = money - biaoJu.total_money;
			biaoJu.total_money = money;
			GameAlert.showAlertUtil(LangAlertInfo.rechargeMoneyComplete,null,MoneyUtil.getHtmlMoneyString(rechargeMoney));
			EventManager.dispatchEvent(BiaoJuEvent.RECHARGE_MONEY);
		}
		
		//----------------------------开启关闭镖局相关的
		/**自动关闭镖局**/
		public static function autoStopBiaoJuBroadcast(country:int):void
		{
			if(country == CountryManager.getSelfCountryId())
				isOpen = false;
			NoticeManager.showNotify(CountryManager.getCountryName(country)+"自动关闭了镖局");
		}
		/**设置开始结束时间**/
		public static function setBiaoJuOpenInfo(start:Number,end:Number):void
		{
			openTime = start;
			closeTime = end;
			trace("open:"+TimeUtil.changeTimeToSpecStr(openTime));
			trace("closeTime:"+TimeUtil.changeTimeToSpecStr(closeTime));
			var nowTime : Number = SystemTimeManager.curtTm;
			trace("nowTime:"+TimeUtil.changeTimeToSpecStr(nowTime));
			if(closeTime > nowTime)
			{
				isOpen = true;
				TimerServer.add(biaoJuEndBroadcast,end - SystemTimeManager.curtTm)
			}else
				isOpen = false;
		}
		
		private static function biaoJuEndBroadcast():void
		{
			isOpen = false;
//			EventManager.dispatchEvent(BiaoJuEvent.OPEN_BIAO_JU);
			getBiaoJuBaseData();
			NoticeManager.showNotify("镖局关闭了");
		}
		
		/**开启/关闭镖局广播**/
		public static function openBiaoJuBroadcast(country:int,b:Boolean):void
		{
			var msg : String;
			if(b)
				msg = CountryManager.getCountryName(country)+"国营镖局已经开启了";
			else
				msg = CountryManager.getCountryName(country)+"国营镖局已经关闭了";
			NoticeManager.systemSwitchNotify(msg);
			if(country == CountryManager.getSelfCountryId())
			{
				isOpen = b;
				if(CountryManager.getSelfIsKing())
				{
					//如果收到开启广播的是自己国家的，并且自己是国王，那就提示开启镖局了
					if(b)
						GameAlert.showAlertUtil(LangAlertInfo.biaoJuOpen);
					else					
						GameAlert.showAlertUtil(LangAlertInfo.biaojuClose);
				}
				EventManager.dispatchEvent(BiaoJuEvent.OPEN_BIAO_JU);
			}
		}
		/**开启/关闭镖局**/
		public static function openOrCloseBiaoJu(b:Boolean):void
		{
			if(b)
			{
				if(!CountryManager.getSelfIsKing())
				{
					GameAlert.showAlertUtil(LangAlertInfo.biaojuOpenError2);
					return;
				}
				if(!BiaoJuManager.biaoJu.is_manual_stop)
				{
					//策划说如果是镖局自动关闭的，再点就关闭自动开启关闭功能
					BiaoJuSender.openBiaoJu(false);
					return;
				}
				if(biaoJu.total_money < miscData.startMinAmount)
				{
					GameAlert.showAlertUtil(LangAlertInfo.biaojuOpenError1,null,null,false,null,MoneyUtil.getHtmlMoneyString(miscData.startMinAmount));
					return;
				}
				BiaoJuSender.openBiaoJu(true);
			}else
			{
				if(!CountryManager.getSelfIsKing())
				{
					GameAlert.showAlertUtil(LangAlertInfo.biaojuCloseError1);
					return;
				}
				if(SystemTimeManager.curtTm - miscData.manualStopNeedStartDuration > openTime)
				{
					GameAlert.showAlertUtil(LangAlertInfo.biaojuCloseError2);
					return;
				}
				BiaoJuSender.openBiaoJu(false);
			}
		}
		
		public static function setBiaoJuIsOpen():void
		{
			openOrCloseBiaoJu(!isOpen);
		}
		
		public static function getXiangXiList():Array
		{
			var reslut : Array = [];
			
			return reslut;
		}
		
		public static function getLogType(type:int):String
		{
			switch(type)
			{
				case BiaoJuLogType.RECHARGE:
					return "充入本金";
				case BiaoJuLogType.SALARY:
					return "发放薪水";
				case BiaoJuLogType.REPARATION:
					return "发放赔偿";
				case BiaoJuLogType.PROFIT:
					return "获得利润";
			}
			return "";
		}
	}
}