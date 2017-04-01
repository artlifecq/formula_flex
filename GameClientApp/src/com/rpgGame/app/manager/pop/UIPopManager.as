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
		private static var aloneShowMap:HashMap=new HashMap();
		
		public function UIPopManager()
		{
		}
		
		/**
		 *显示独立的弹窗UI 
		 * 
		 */
		public static function showAlonePopUI(cls:Class,data:*=null,force:Boolean=false):void
		{
			var newUI:PopSkinUI=new cls(data);
			var clsName:String=getQualifiedClassName(newUI);
			var showUI:PopSkinUI=aloneShowMap.getValue(clsName);
			if(showUI){
				StarlingLayerManager.topUILayer.removeChild(showUI);
			}
			aloneShowMap.add(clsName,newUI);
			StarlingLayerManager.topUILayer.addChild(newUI);
		}
		
		public static function showPopUI(cls:Class,data:*=null,force:Boolean=false):void
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