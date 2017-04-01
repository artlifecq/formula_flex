package com.rpgGame.app.manager.pop
{
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.core.manager.StarlingLayerManager;

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
		
		public function UIPopManager()
		{
		}
		
		public static function showPopUI(cls:Class,data:*,force:Boolean=false):void
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