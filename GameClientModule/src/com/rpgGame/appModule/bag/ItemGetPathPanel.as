package com.rpgGame.appModule.bag
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.info.item.ComboItemInfo;
	
	import org.mokylin.skin.common.alert.AlertLujing_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *物品获取途径
	 *@author dik
	 *2017-4-26下午4:20:34
	 */
	public class ItemGetPathPanel extends SkinUIPanel
	{
		private var _skin:AlertLujing_Skin;
		public function ItemGetPathPanel()
		{
			_skin=new AlertLujing_Skin();
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data, openTable, parentContiner);
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=(this.parent.width-337)>>1;
			this.y=(this.parent.height-205)>>1;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.lb_hecheng){
				this.hide();
				var info:ComboItemInfo=new ComboItemInfo();
				info.targetId=_data as int;
				AppManager.showAppNoHide(AppConstant.EQUIP_PANL,info,EmFunctionID.EM_HECHENG);
			}
		}
	}
}