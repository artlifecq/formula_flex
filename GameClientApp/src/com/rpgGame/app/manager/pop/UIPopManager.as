package com.rpgGame.app.manager.pop
{
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import flash.utils.getQualifiedClassName;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *顶层飘字管理 
	 * @author dik
	 * 
	 */
	public class UIPopManager
	{
		private static var showList:Vector.<PopSkinUI>=new Vector.<PopSkinUI>();
		private static var isShowing:Boolean;

		private static var currSkin:PopSkinUI;
		private static var soleShowMap:HashMap=new HashMap();
		
		public function UIPopManager()
		{
		}
		
		/**
		 *独立弹窗 
		 * @param cls
		 * @param data
		 * @param force
		 * 
		 */
		public static function showAlonePopUI(cls:Class,data:*=null,force:Boolean=false):void
		{
			var newUI:PopSkinUI=new cls(data);
			var clsName:String=getQualifiedClassName(newUI);
			StarlingLayerManager.topUILayer.addChild(newUI);
		}
		
		/**
		 *显示唯一的弹窗UI 
		 * 移除之前一样的
		 */
		public static function showSolePopUI(cls:Class,data:*=null,force:Boolean=false):void
		{
			var newUI:PopSkinUI=new cls(data);
			var clsName:String=getQualifiedClassName(newUI);
			var showUI:PopSkinUI=soleShowMap.getValue(clsName);
			if(showUI){
				StarlingLayerManager.topUILayer.removeChild(showUI);
			}
			soleShowMap.add(clsName,newUI);
			StarlingLayerManager.topUILayer.addChild(newUI);
		}
		
		/**
		 *屏幕中央顺序弹窗 
		 * @param cls
		 * @param data
		 * @param force
		 * 
		 */
		public static function showCenterPopUI(cls:Class,data:*=null,force:Boolean=false):void
		{
			var ui:PopSkinUI=new cls(data);
			if(force){
				ui.showEnd=showNext;
				StarlingLayerManager.topUILayer.addChild(ui);
				return;	
			}
			showList.push(ui);
			if(!isShowing){
				showNext();
			}
		}
		
		private static function showNext():void
		{
			isShowing=false;
			if(showList.length==0){
				return;
			}
			isShowing=true;
			currSkin=showList.shift();
			currSkin.showEnd=showNext;
			StarlingLayerManager.topUILayer.addChild(currSkin);
		}
	}
}