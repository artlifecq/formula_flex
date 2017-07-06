package com.rpgGame.app.ui.main.buttons
{
	import com.game.engine3D.config.GlobalConfig;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButton;
	import com.rpgGame.app.ui.main.activityBar.item.LimitTimeActivityButton;
	import com.rpgGame.app.ui.main.activityBar.item.MultyActivityButton;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import away3d.log.Log;
	
	import org.client.mainCore.ds.HashMap;
	import org.mokylin.skin.mainui.activityBar.button.ButtonDianfengduijue;
	import org.mokylin.skin.mainui.activityBar.button.ButtonFubendating;
	import org.mokylin.skin.mainui.activityBar.button.ButtonFubenduilie;
	import org.mokylin.skin.mainui.activityBar.button.ButtonHongbao;
	import org.mokylin.skin.mainui.activityBar.button.ButtonHuangchengzhengba;
	import org.mokylin.skin.mainui.activityBar.button.ButtonHuodongtating;
	import org.mokylin.skin.mainui.activityBar.button.ButtonJiucengyaota;
	import org.mokylin.skin.mainui.activityBar.button.ButtonJixianboss;
	import org.mokylin.skin.mainui.activityBar.button.ButtonLunjian;
	import org.mokylin.skin.mainui.activityBar.button.ButtonShijieboss;
	import org.mokylin.skin.mainui.activityBar.button.ButtonShuangbeihubao;
	import org.mokylin.skin.mainui.activityBar.button.ButtonTianjianglijing;
	import org.mokylin.skin.mainui.activityBar.button.ButtonWangchengzhengba;
	import org.mokylin.skin.mainui.activityBar.button.ButtonZhanchangdating;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_jinjie;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_renwu;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_shangcheng;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_shejiao;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_wuxue;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhanhun;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhuangbei;

	/**
	 *主按钮配置管理器 
	 * @author dik
	 * 
	 */
	public class MainButtonManager
	{
		private static var _classMap:HashMap;
		private static var _initializeMap:HashMap;
		public static function init():void
		{
			_initializeMap = new HashMap();
			_classMap = new  HashMap();
			regClass(1,MainButton_Role,ButtonSkin_renwu);
			regClass(2,MainButton_Mount,ButtonSkin_jinjie);
			regClass(3,MainButton_Equip,ButtonSkin_zhuangbei);
			regClass(4,MainButton_WuXue,ButtonSkin_wuxue);
			regClass(5,MainButton_ZhanHun,ButtonSkin_zhanhun);
			regClass(6,MainButton_Gang,ButtonSkin_shejiao);
			regClass(7,MainButtonBases,ButtonSkin_shangcheng);
			regClass(101,ActivityButton,ButtonHuodongtating);
			regClass(102,ActivityButton,ButtonLunjian);
			regClass(103,ActivityButton,ButtonFubendating);
			regClass(104,ActivityButton,ButtonZhanchangdating);
			regClass(105,ActivityButton,ButtonHongbao);
			regClass(300,MultyActivityButton,ButtonFubenduilie);
			regClass(301,LimitTimeActivityButton,ButtonShijieboss);
			regClass(302,LimitTimeActivityButton,ButtonDianfengduijue);
			regClass(303,LimitTimeActivityButton,ButtonShuangbeihubao);
			regClass(304,LimitTimeActivityButton,ButtonJiucengyaota);
			regClass(305,LimitTimeActivityButton,ButtonHuangchengzhengba);
			regClass(306,LimitTimeActivityButton,ButtonWangchengzhengba);
			regClass(307,LimitTimeActivityButton,ButtonWangchengzhengba);
			regClass(308,LimitTimeActivityButton,ButtonFubenduilie);
			regClass(309,LimitTimeActivityButton,ButtonTianjianglijing);
			regClass(310,LimitTimeActivityButton,ButtonJixianboss);
		}
		private static function regClass(id:int,cls:Class,skinui:Class):void
		{
			_classMap.add(id,[cls,skinui]);
		}
		
		public static function getButtonBuyInfo(info:FunctionBarInfo):IOpen
		{
			var level:int = FunctionOpenManager.getOpenLevelByFunBarInfo(info);
			if(!_initializeMap||!FunctionOpenManager.checkOpenByLevel(level))
				return null;
			var button:IOpen = _initializeMap.getValue(info.id);
			if(button == null)
			{
				var clsNames:Array= _classMap.getValue(info.id);
				if(clsNames==null)
				{
					Log.error(GlobalConfig.DEBUG_HEAD + " " + "[MainButtonManager]:按钮皮肤未配置" + info.id);
					return null;
				}
				var cls : Class = clsNames[0] as Class;
				button = new cls();
				button.info = info;
				button.styleClass = clsNames[1] as Class
				button.name = info.id.toString();
				_initializeMap.add(info.id,button);
			}
			return button as IOpen;
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
			var bar:FunctionBarInfo=FuncionBarCfgData.getActivityBarInfo(id);
			if(bar)
			{
				var button:ActivityButton= MainButtonManager.getButtonBuyInfo(bar) as ActivityButton;
				if(button)
				{
					button.onActivityOpen(data);
				}
			}
		}
		
		/**开启活动按钮by id----yt*/
		public static function openActivityButton(id:int):void
		{
			var bar:FunctionBarInfo=FuncionBarCfgData.getActivityBarInfo(id);
			if(bar)
			{
				var button:ActivityButton= MainButtonManager.getButtonBuyInfo(bar) as ActivityButton;
				if(button)
				{
					button.onActivityOpen();
				}
			}
		}
		/**关闭活动按钮 byid----yt*/
		public static function closeActivityButton(id:int):void
		{
			var bar:FunctionBarInfo=FuncionBarCfgData.getActivityBarInfo(id);
			if(bar)
			{
				var button:ActivityButton= MainButtonManager.getButtonBuyInfo(bar) as ActivityButton;
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
			var bar:FunctionBarInfo=FuncionBarCfgData.getActivityBarInfo(id);
			if(bar)
			{
				var button:ActivityButton= MainButtonManager.getButtonBuyInfo(bar) as ActivityButton;
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
			var bar:FunctionBarInfo=FuncionBarCfgData.getActivityBarInfo(id);
			if(bar)
			{
				var button:ActivityButton= MainButtonManager.getButtonBuyInfo(bar) as ActivityButton;
				if(button)
				{
					button.clearTime();
				}
			}
		}
		
		
		
	}
}