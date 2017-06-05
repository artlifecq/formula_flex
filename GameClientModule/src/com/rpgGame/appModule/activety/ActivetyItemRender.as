package com.rpgGame.appModule.activety
{
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.activety.ActiveItemSelecteSkin;
	import org.mokylin.skin.app.activety.zonghe.Active_Item;
	import org.mokylin.skin.app.jianghu.lunjian.NameItemSelect;
	
	import starling.display.DisplayObject;
	
	/**
	 *活动条渲染器 
	 * @author dik
	 * 
	 */
	public class ActivetyItemRender extends DefaultListItemRenderer
	{
		private var _skin:Active_Item;
		
		public function ActivetyItemRender()
		{
			super();
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
			_skin=new Active_Item();
			_skin.toSprite(this);
			
			_skin.selectedBtn.defaultIcon=null;
			
			var btnSkin:ActiveItemSelecteSkin=new ActiveItemSelecteSkin();
			_skin.selectedBtn.upSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset2;
			_skin.selectedBtn.hoverSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.selectedUpSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.selectedDownSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.selectedHoverSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.downSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
		}
		
		override protected function commitData():void
		{
			if(_skin&&this.owner){
				_skin.selectedBtn.isSelected=this.owner.selectedItem==data;
			}
		}
	}
}