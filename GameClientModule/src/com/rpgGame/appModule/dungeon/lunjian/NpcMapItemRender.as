package com.rpgGame.appModule.dungeon.lunjian
{
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_NameItem;
	import org.mokylin.skin.app.jianghu.lunjian.NameItemSelect;
	
	import starling.display.DisplayObject;
	
	/**
	 *npc所在地图渲染器
	 *@author dik
	 *2017-5-2下午7:32:40
	 */
	public class NpcMapItemRender extends DefaultListItemRenderer
	{
		private var _skin:LunJian_NameItem;
		
		public function NpcMapItemRender()
		{
			super();
		}
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.selectedBtn){
				_skin.selectedBtn.isSelected=true;
			}
		}
			
		
		override protected function initialize():void
		{
			_skin=new LunJian_NameItem();
			_skin.toSprite(this);
			_skin.selectedBtn.defaultIcon=null;
			
			var btnSkin:NameItemSelect=new NameItemSelect();
			_skin.selectedBtn.upSkin=btnSkin.__NameItemSelect_UIAsset2;
			_skin.selectedBtn.hoverSkin=btnSkin.__NameItemSelect_UIAsset1;
			_skin.selectedBtn.selectedUpSkin=btnSkin.__NameItemSelect_UIAsset1;
			_skin.selectedBtn.selectedDownSkin=btnSkin.__NameItemSelect_UIAsset1;
			_skin.selectedBtn.selectedHoverSkin=btnSkin.__NameItemSelect_UIAsset1;
			_skin.selectedBtn.downSkin=btnSkin.__NameItemSelect_UIAsset1;
		}
		
		override protected function commitData():void
		{
			if(_skin&&this.owner){
				var data:NpcMapItemData=_data as NpcMapItemData;
				_skin.lbName.text=data.sceneData.name;
				_skin.lbLevel.text="("+data.sceneData.requiredLevel+")";
				_skin.lbNum.text=data.leftNum.toString();
				_skin.lbNum.visible=_skin.numBg.visible=data.leftNum!=0;
				_skin.selectedBtn.isSelected=this.owner.selectedItem==data;
			}
		}
	}
}