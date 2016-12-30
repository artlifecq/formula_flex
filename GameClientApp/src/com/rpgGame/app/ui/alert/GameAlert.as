package com.rpgGame.app.ui.alert
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.AlertTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertInfo;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.DisplayObject;

	/**
	 * 游戏弹窗提示
	 * @author mandragora
	 */
	public class GameAlert extends SkinUIPanel
	{
		public var skin : StateSkin;
		public var alertType : int;
		public var key : String;
		public var alertSet : AlertSetInfo;
		public var clickType : int;
		public var clickCallBack : Function;
		public var callBackArgs : Array;

		public function GameAlert(type : int)
		{
			alertType = type;
			switch (type)
			{
				case AlertTypeEnum.ALERT_TYPE_OK:
					//skin = new AlertOkSkin();
					break;
				case AlertTypeEnum.ALERT_TYPE_OK_CANCEL:
					//skin = new AlertSkin();
					break;
				case AlertTypeEnum.ALERT_TYPE_TRANSPARENT_OK:
					//skin = new AlertTransparentOkSkin();
					break;
				case AlertTypeEnum.ALERT_TYPE_TRANSPARENT_OK_CANCEL:
					//skin = new AlertTransparentOkCancelSkin();
					break;
			}
			super(skin);
		}

		override protected function onTouchTarget(target : DisplayObject) : void
		{
			if(!alertSet)
				return;
			switch (target)
			{
				case btnOk:
					clickType = AlertClickTypeEnum.TYPE_SURE;
					break;
				case btnCancel:
					clickType = AlertClickTypeEnum.TYPE_CANCEL;
					break;
				case btnClose:
					clickType = AlertClickTypeEnum.TYPE_CLOSE;
					hide();
					break;
				default:
					return;
			}
			
			if(clickCallBack)
			{
				if(callBackArgs!=null)
					clickCallBack.apply(null,[this].concat(callBackArgs));
				else
					clickCallBack(this);
			}
				
			if (alertSet.isClickHide)
				hide();
		}

		public function set autoCloseTime(value : int) : void
		{
			TweenLite.killDelayedCallsTo(hide);
			TweenLite.delayedCall(value * 0.001, hide);
		}

		/**
		 * 这里不是正式弹窗，做调试用的，如果不是必要千万别用这个！以后肯定会移除的！ 
		 * @param msg
		 * @param title
		 * @return 
		 * 
		 */		
		public static function debugShow(msg : String,title : String = "提 示") : GameAlert
		{
			var gameAlert : GameAlert;
			if (!showAlertMap)
				showAlertMap = new HashMap();
			if (showAlertMap.getValue(msg))
			{
				gameAlert = showAlertMap.getValue(msg);
			}
			else
				gameAlert = getAlertByType(AlertTypeEnum.ALERT_TYPE_OK_CANCEL);
			gameAlert.alertSet = new AlertSetInfo();
			gameAlert.alertSet.key = msg;
			if (gameAlert.cboxTip)
			{
				gameAlert.cboxTip.visible = false;
				gameAlert.cboxTip.isSelected = false;
			}
			if (gameAlert.lbTip)
				gameAlert.lbTip.htmlText = msg;
			if (gameAlert.title)
				gameAlert.title.htmlText = title;
			StarlingLayerManager.topUILayer.addChild(gameAlert);
			if (!showAlertMap)
				showAlertMap = new HashMap();
			showAlertMap.add(msg, gameAlert);
			return gameAlert;
		}
		
		/**
		 * 快捷显示提示的，还是需要配置，只是不需要写这么多东西了。 
		 * @param key
		 * @param clickCallBack
		 * @param args
		 * @return 
		 * 
		 */		
		public static function showAlertUtil(key:String,clickCallBack:Function=null,...args):GameAlert
		{
			var alertSet : AlertSetInfo = new AlertSetInfo();
			alertSet.setAlertInfo(key,args);
			return showAlert(alertSet,clickCallBack);
		}

		/**
		 * 显示提示，alertSetInfo中设置一些gameAlert必要属性，如果不设置就是默认设置
		 * @param alertSet
		 * @param clickCallBack
		 * @param args
		 * @return 
		 * 
		 */		
		public static function showAlert(alertSet : AlertSetInfo,clickCallBack : Function = null,...args) : GameAlert
		{
			if(!alertSet || !alertSet.alertInfo)
				return null;
			var alertInfo : AlertInfo = alertSet.alertInfo;
			if (!showAlertMap)
				showAlertMap = new HashMap();
			var gameAlert : GameAlert = showAlertMap.getValue(alertSet.key);
			if (gameAlert)
			{
				//移到上层
				gameAlert.show();
				return null;
			}
			gameAlert = getAlertByType(alertInfo.alertType);
			gameAlert.alertSet = alertSet;
			gameAlert.clickCallBack = clickCallBack;
			if(!isNaN(alertSet.autoCloseTime))
				gameAlert.autoCloseTime = alertSet.autoCloseTime;
			if (gameAlert.cboxTip)
			{
				gameAlert.cboxTip.visible = alertSet.isShowCBox;
				gameAlert.cboxTip.isSelected = false;
			}
			if (gameAlert.lbTip)
			{
				gameAlert.lbTip.htmlText = alertInfo.value;
				gameAlert.lbTip.textAlign = alertInfo.align;
				trace("弹出框TextAlignType:" + alertInfo.align);
			}
			if (gameAlert.title)
				gameAlert.title.htmlText = alertInfo.title;
			if (gameAlert.btnOk)
				gameAlert.btnOk.label = alertInfo.leftValue ? alertInfo.leftValue : "确认";
			if (gameAlert.btnCancel)
				gameAlert.btnCancel.label = alertInfo.rightValue ? alertInfo.rightValue : "取消";
			gameAlert.callBackArgs = args;
			StarlingLayerManager.topUILayer.addChild(gameAlert);
			showAlertMap.add(alertSet.key, gameAlert);
			return gameAlert;
		}

		private static var showAlertMap : HashMap = new HashMap();
		private static var alertPools : HashMap = new HashMap();

		/**从池中获取指定类型的一个alert**/
		private static function getAlertByType(type : int) : GameAlert
		{
			if (!alertPools)
				alertPools = new HashMap();
			var alerts : Array = alertPools.getValue(type);
			if (!alerts)
			{
				alerts = [];
				alertPools.add(type, alerts);
			}
			if (alerts.length > 0)
				return alerts.shift();
			else
			{
				return new GameAlert(type);
			}
		}

		override public function hide() : void
		{
			if (!alertPools)
				alertPools = new HashMap();
			var alerts : Array = alertPools.getValue(this.alertType);
			if (!alerts)
			{
				alerts = [];
				alertPools.add(this.alertType, alerts);
			}
			alerts.push(this);
			showAlertMap.remove(alertSet.key);
			TweenLite.killDelayedCallsTo(hide);
			super.hide();
		}

		public static function closeAlert(key : String) : void
		{
			if (showAlertMap&&showAlertMap.containsKey(key))
			{
				var alertView : GameAlert = showAlertMap.getValue(key);
				alertView.hide();
			}
		}
		
		public function get isCheckSelected() : Boolean
		{
			return skin["cboxTip"] && skin["cboxTip"].isSelected;
		}
		
		private function get btnOk() : Button
		{
			return skin.hasOwnProperty("btnOk") ? skin["btnOk"] : null;
		}
		
		private function get btnClose() : Button
		{
			return skin.hasOwnProperty("btnClose") ? skin["btnClose"] : null;
		}
		
		private function get btnCancel() : Button
		{
			return skin.hasOwnProperty("btnCancel") ? skin["btnCancel"] : null;
		}
		
		private function get cboxTip() : Check
		{
			return skin.hasOwnProperty("cboxTip") ? skin["cboxTip"] : null;
		}
		
		private function get lbTip() : Label
		{
			return skin.hasOwnProperty("lbTip") ? skin["lbTip"] : null;
		}
		
		private function get title() : Label
		{
			return skin.hasOwnProperty("title") ? skin["title"] : null;
		}
	}
}
