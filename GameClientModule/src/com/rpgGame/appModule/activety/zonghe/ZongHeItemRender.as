package com.rpgGame.appModule.activety.zonghe
{
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.activety.ActiveItemSelecteSkin;
	import org.mokylin.skin.app.activety.zonghe.Active_Item;
	
	import starling.display.DisplayObject;
	
	/**
	 *活动条渲染器 
	 * @author dik
	 * 
	 */
	public class ZongHeItemRender extends DefaultListItemRenderer
	{
		private var _skin:Active_Item;
		
		public function ZongHeItemRender()
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
		
		override public function get height():Number
		{
			return _skin.height;
		}
		
		override protected function initialize():void
		{
			_skin=new Active_Item();
			_skin.toSprite(this);
			
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
				if(_skin.selectedBtn.defaultIcon){
					_skin.selectedBtn.defaultIcon=null;
				}
				_skin.selectedBtn.isSelected=this.owner.selectedItem==data;
				var info:ActivetyInfo=_data as ActivetyInfo;
				if(!info||info.info==null){
					return;
				}
				_skin.uiName.styleName="ui/app/activety/zonghe/active_name/"+info.actCfg.q_res_id+".png";
				_skin.uiBg.styleName="ui/big_bg/activety/item/"+info.actCfg.q_res_id+".png";
				_skin.lbMsg.htmlText=info.actCfg.q_desc;
				if(info.info.joinState==0){
					_skin.uiJinxing.visible=false;
					GrayFilter.gray(this);
				}else{
					GrayFilter.unGray(this);
					if(info.info.joinState==1){
						_skin.uiJinxing.visible=false;
					}else{
						_skin.uiJinxing.visible=true;
					}
				}
			}
		}
	}
}