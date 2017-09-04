package com.rpgGame.app.ui.main.buttons
{
	import com.game.engine3D.config.GlobalConfig;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButton;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButtonBase;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityRedRewardButton;
	import com.rpgGame.app.ui.main.activityBar.item.LimitTimeActivityButton;
	import com.rpgGame.app.ui.main.activityBar.item.MultyActivityButton;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
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
			regClass(1,ButtonSkin_renwu);
			regClass(2,ButtonSkin_jinjie);
			regClass(3,ButtonSkin_zhuangbei);
			regClass(4,ButtonSkin_wuxue);
			regClass(5,ButtonSkin_zhanhun);
			regClass(6,ButtonSkin_bangpai);
			regClass(7,ButtonSkin_shangcheng);
			regClass(8,ButtonSkin_zudui);
			regClass(9,ButtonSkin_meiren);
			
			var btnLists:Array=NewFuncCfgData.getAllFuncList();
			for(var i:int=0;i<btnLists.length;i++){
				var info:Q_newfunc=btnLists[i];
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
			var level:int = info.q_level;
			if(!_initializeMap||!FunctionOpenManager.checkOpenByLevel(level))
				return null;
			var button:IOpen = _initializeMap.getValue(info.q_id);
			if(button == null)
			{
				var styleName:*= _classMap.getValue(info.q_id);
				if(styleName==null)
				{
					Log.error(GlobalConfig.DEBUG_HEAD + " " + "[MainButtonManager]:按钮皮肤未配置" + info.q_id);
					return null;
				}
				button = getBtnById(info.q_id);
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
				case 1:
					return new MainButton_Role();
				case 2:
					return new MainButton_Mount();
				case 3:
					return new MainButton_Equip();
				case 4:
					return new MainButton_WuXue();
				case 5:
					return new MainButton_ZhanHun();
				case 6:
					return new MainButton_Gang();
				case 7:
					return new MainButton_ShangCheng();
				case 8:
					return new MainButton_Team();
				case 9:
					return new MainButton_MeiRen();
				case 101:
				case 102:
				case 103:
				case 104:
				case 120:
					return new ActivityButton();
				case 105:
					return new ActivityRedRewardButton();
				case 300:
					return new MultyActivityButton();
				case 301:
				case 302:
				case 303:
				case 304:
				case 305:
				case 306:
				case 307:
				case 308:
				case 309:
				case 310:
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