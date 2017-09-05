package com.rpgGame.app.ui.main.buttons
{
	import com.game.engine3D.config.GlobalConfig;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButton;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButtonBase;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityRedRewardButton;
	import com.rpgGame.app.ui.main.activityBar.item.LimitTimeActivityButton;
	import com.rpgGame.app.ui.main.activityBar.item.MultyActivityButton;
	import com.rpgGame.coreData.cfg.MainBtnCfgData;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mainbtn;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.enum.EmMainBtnID;
	
	import away3d.log.Log;
	
	import org.client.mainCore.ds.HashMap;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_bangpai;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_jinjie;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_meiren;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_renwu;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_shangcheng;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_wuxue;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhanhun;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhuangbei;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zudui;

	public class MainButtonManager
	{
		private static var _classMap:HashMap;
		private static var _initializeMap:HashMap;
		public static function init():void
		{
			_initializeMap = new HashMap();
			_classMap = new  HashMap();
			
			//主界面
			regClass(EmMainBtnID.RENWU,ButtonSkin_renwu);
			regClass(EmMainBtnID.JINJIE,ButtonSkin_jinjie);
			regClass(EmMainBtnID.DUANZAO,ButtonSkin_zhuangbei);
			regClass(EmMainBtnID.WUXUE,ButtonSkin_wuxue);
			regClass(EmMainBtnID.ZHANHUN,ButtonSkin_zhanhun);
			regClass(EmMainBtnID.BANGPAI,ButtonSkin_bangpai);
			regClass(EmMainBtnID.SHANGCHENG,ButtonSkin_shangcheng);
			regClass(EmMainBtnID.ZUDUI,ButtonSkin_zudui);
			regClass(EmMainBtnID.MEIREN,ButtonSkin_meiren);
			
			var btnLists:Array=MainBtnCfgData.getAllBtnList();
			for(var i:int=0;i<btnLists.length;i++){
				var info:Q_mainbtn=btnLists[i];
				if(info.q_btn_res){
					regClass(info.q_id,info.q_btn_res);
				}
			}
		}
		private static function regClass(id:int,skinui:*):void
		{
			_classMap.add(id,skinui);
		}
		
		public static function getButtonByInfo(info:Q_newfunc):IOpen
		{
			if(!info){
				return null;
			}
			var level:int = info.q_level;
			if(!_initializeMap||!FunctionOpenManager.checkOpenByLevel(level))
				return null;
			var button:IOpen = _initializeMap.getValue(info.q_id);
			if(button == null)
			{
				if(info.q_open_btn==0){
					return null;
				}
				var btnInfo:Q_mainbtn=MainBtnCfgData.getMainBtnCfg(info.q_open_btn);
				var styleName:*= _classMap.getValue(btnInfo.q_id);
				if(styleName==null)
				{
					Log.error(GlobalConfig.DEBUG_HEAD + " " + "[MainButtonManager]:按钮皮肤未配置" + info.q_id);
					return null;
				}
				button = getBtnById(btnInfo.q_id);
				button.info = info;
				if(styleName is String){
					if((button as ActivityButtonBase)){
						(button as ActivityButtonBase).styleName=styleName;
					}
				}else{
					button.styleClass=styleName;
				}
				button.name = info.q_id.toString();
				_initializeMap.add(info.q_id,button);
			}
			return button as IOpen;
		}
		
		private static function getBtnById(id:int):IOpen
		{
			
			switch(id){
				case EmMainBtnID.RENWU:
					return new MainButton_Role();
				case EmMainBtnID.JINJIE:
					return new MainButton_Mount();
				case EmMainBtnID.DUANZAO:
					return new MainButton_Equip();
				case EmMainBtnID.WUXUE:
					return new MainButton_WuXue();
				case EmMainBtnID.ZHANHUN:
					return new MainButton_ZhanHun();
				case EmMainBtnID.ZUDUI:
					return new MainButton_Gang();
				case EmMainBtnID.SHANGCHENG:
					return new MainButton_ShangCheng();
				case EmMainBtnID.ZUDUI:
					return new MainButton_Team();
				case EmMainBtnID.MEIREN:
					return new MainButton_MeiRen();
				case EmMainBtnID.HUODONG:
				case EmMainBtnID.LUNJIAN:
				case EmMainBtnID.FUBEN:
				case EmMainBtnID.ZHANCHANG:
				case EmMainBtnID.FANGCHENMI:
					return new ActivityButton();
				case EmMainBtnID.HONGBAO:
					return new ActivityRedRewardButton();
				case EmMainBtnID.PIPEIDUILIE:
					return new MultyActivityButton();
				case EmMainBtnID.SHIJIEBOSS:
				case  EmMainBtnID.DIANFENG:
				case  EmMainBtnID.DIANFENG:
				case EmMainBtnID.HUBAO:
				case EmMainBtnID.JIUCENG:
				case EmMainBtnID.HUANGCHENG:
				case EmMainBtnID.WANGCHENG:
				case EmMainBtnID.WEICHENG:
				case EmMainBtnID.QINLINGMIBAO:
				case EmMainBtnID.TIANJIANGLIJING:
				case EmMainBtnID.JIXIANTIAOZHAN:
					return new LimitTimeActivityButton();
			}
			
			return new ActivityButton();
		}
		
		public static function getButtonName(id:int):String
		{
			return id.toString();
		}
		
		/**
		 *开启活动 通过id和数据
		 * @param id
		 * @param data
		 * 
		 */
		public static function openActByData(id:int,data:Object):void
		{
			var info:Q_newfunc=NewFuncCfgData.getFuncCfg(id);
			if(info)
			{
				var button:ActivityButton= MainButtonManager.getButtonByInfo(info) as ActivityButton;
				if(button)
				{
					button.onActivityOpen(data);
				}
			}
		}
		
		/**开启活动按钮by id----yt*/
		public static function openActivityButton(id:int):void
		{
			var info:Q_newfunc=NewFuncCfgData.getFuncCfg(id);
			if(info)
			{
				var button:ActivityButton= MainButtonManager.getButtonByInfo(info) as ActivityButton;
				if(button)
				{
					button.onActivityOpen();
				}
			}
		}
		/**关闭活动按钮 byid----yt*/
		public static function closeActivityButton(id:int):void
		{
			var info:Q_newfunc=NewFuncCfgData.getFuncCfg(id);
			if(info)
			{
				var button:ActivityButton= MainButtonManager.getButtonByInfo(info) as ActivityButton;
				if(button)
				{
					button.onActivityClose();
				}
			}
		}
		
		/** 设置按钮计时 byid----yt
		 * startTime 计时开始时间 秒
		 * */
		public static function setUptimeActivityButton(id:int,startTime:int=0):void
		{
			var info:Q_newfunc=NewFuncCfgData.getFuncCfg(id);
			if(info)
			{
				var button:ActivityButton= MainButtonManager.getButtonByInfo(info) as ActivityButton;
				if(button)
				{
					button.setupActTime(0,false);
				}
			}
		}
		/** 设置按钮计时 byid----yt
		 * 取消计时
		 * */
		public static function clearUptimeActivityButton(id:int):void
		{
			var info:Q_newfunc=NewFuncCfgData.getFuncCfg(id);
			if(info)
			{
				var button:ActivityButton= MainButtonManager.getButtonByInfo(info) as ActivityButton;
				if(button)
				{
					button.clearTime();
				}
			}
		}
		
		
		
	}
}