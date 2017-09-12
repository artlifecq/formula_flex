package com.rpgGame.app.ui.main.openActivity.sub
{
	import com.rpgGame.app.ctrl.TouchCtrl;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import feathers.controls.UIAsset;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.core.ToggleGroup;
	import feathers.themes.GuiTheme;
	
	import org.mokylin.skin.app.openActivity.OpenActivityCommonBtnSkin;
	
	import starling.display.Image;
	
	public class GeneralActTypeBtnRender extends DefaultListItemRenderer
	{
		private var _skin:OpenActivityCommonBtnSkin;
		private var _call:Function;
		public function GeneralActTypeBtnRender(c:Function,t:ToggleGroup)
		{
			super();
			_skin=new OpenActivityCommonBtnSkin();
			_skin.toSprite(this);
			var touch:TouchCtrl=new TouchCtrl(this,onClick);
			_call=c;
			_skin.btn.toggleGroup=t;
		}
		override public function dispose():void
		{
			super.dispose();
			_skin.btn.toggleGroup=null;
			_call=null;
		}
		private function onClick():void
		{
			// TODO Auto Generated method stub
			if (_call) 
			{
				_call(subType);
				_skin.btn.isSelected=true;
			}
		}
		override public function get width():Number
		{
			return _skin.width;
		}
		override public function get height():Number
		{
			return _skin.height;
		}
		public function get subType():int
		{
			var infos:Vector.<ActivityVo>=_data as Vector.<ActivityVo>;
			if (infos&&infos.length>0) 
			{
				var vo:ActivityVo=infos[0];
				return vo.childPanelType;
			}
			return 0;
		}
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				var infos:Vector.<ActivityVo>=_data as Vector.<ActivityVo>;
				if (infos&&infos.length>0) 
				{
					var vo:ActivityVo=infos[0];
					if (vo.activityTabName!=null&&vo.activityTabName!="") 
					{
						MCUtil.removeAllChild(_skin.uiText);
						_skin.uiText.addChild(new Image(GuiTheme.ins.getTexture(vo.activityTabName)));
					}
					//小图标
					if (vo.activityImgName != null && vo.activityImgName != "" )
					{
						_skin.icon.styleName=vo.activityImgName;
						_skin.icon.visible=true;
					}
					else
					{
						_skin.icon.visible=false;
					}
					var hasReward:Boolean=false;
					for each( vo in infos )
					{
						if ( vo.IsCanGetReward())
						{
							hasReward = true;
							break;
						}
					}
					_skin.gReward.visible=hasReward;
				}
			}
		}
	}
}