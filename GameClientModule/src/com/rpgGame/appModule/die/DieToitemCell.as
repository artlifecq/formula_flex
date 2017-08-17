package com.rpgGame.appModule.die
{
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.clientConfig.Q_die;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	public class DieToitemCell extends DefaultListItemRenderer
	{
		public function DieToitemCell():void
		{
			super();
		}
		private var _skin:DieToItem;
		override protected function initialize():void
		{
			super.initialize();
			_skin=new DieToItem();
			this.addChild(_skin);
			this.width=_skin.width;
			this.height=_skin.height;
		}
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				_skin.update(this._data as Q_die);
			}
			else
			{
				_skin.clear();
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			_skin.clear();
			MCUtil.removeSelf(_skin);
			_skin=null;
		}
		
		override public function get width():Number
		{
			return _skin.width;
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}