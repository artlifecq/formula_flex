package com.rpgGame.app.ui.main.openActivity.sub
{
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.openActivity.OpenActivityCommonBtnSkin;
	
	public class GeneralActTypeBtnRender extends DefaultListItemRenderer
	{
		private var _skin:OpenActivityCommonBtnSkin;
		public function GeneralActTypeBtnRender()
		{
			super();
			_skin=new OpenActivityCommonBtnSkin();
			_skin.toSprite(this);
			
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
						_skin.uiText.styleName=vo.activityTabName;
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
						if ( vo.IsCanGetReward )
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